import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/static/constants.dart';
import 'package:stucap/utils/utils.dart';

import '../../../config/app_theme.dart';
import '../../../static/assets.dart';
import '../../../static/data_values.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String scanResultFinal = '';

  Future scanQrCode(BuildContext context) async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff1565C0', 'Retour', true, ScanMode.QR);
      setState(() {
        scanResultFinal = scanResult;
      });
    } on PlatformException {
      scanResult = 'Erreur de scannage';
      errorDialog(context, content: 'Une erreur de scan est survenue');
    } catch(e){
      errorDialog(context, content: 'Une erreur de scan est survenue');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.studentImg,
            fit: BoxFit.cover,
          ),
          Container(color: AppThemeData.backgroundBlack.withOpacity(0.7)),
          Positioned(
              top: 37,
              left: 17,
              child: Builder(builder: (context) {
                return InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: AppThemeData.backgroundWhite,
                      size: 30,
                    ));
              })),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DataValues.homeTitle,
                    style: TextStyle(
                      color: AppThemeData.textWhite,
                      fontSize: AppThemeData
                          .lightTheme.textTheme.headlineSmall!.fontSize,
                      fontWeight: AppThemeData
                          .lightTheme.textTheme.titleLarge!.fontWeight,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DataValues.homeDescription,
                    style: TextStyle(
                      color: AppThemeData.textWhite,
                      fontSize: AppThemeData
                          .lightTheme.textTheme.displayMedium!.fontSize,
                      fontWeight: AppThemeData
                          .lightTheme.textTheme.titleLarge!.fontWeight,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomCard(
                    cardTitle: DataValues.homeCardTitle1,
                    isOnBlackBackground: true,
                    onTap: () {
                      Navigator.pushNamed(context, PresenceScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    onTap: () {
                      try {
                        scanQrCode(context).whenComplete(() {
                          scanVerificationPopup(context,
                              content: StreamBuilder<StudentModel>(
                                  stream: StudentsRepository()
                                      .studentModel(scanResultFinal),
                                  builder: (context, snapshot) {
                                    StudentModel? studentModel = snapshot.data;
                                    if (!snapshot.hasData ||
                                        studentModel == null) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (snapshot.hasError) {
                                      errorDialog(context, content: 'Une erreur de scan est survenue');
                                    } else if (studentModel.studentID!.isEmpty){
                                      errorDialog(context, content: 'Une erreur de scan est survenue');
                                    }
                                    return studentModel.studentID!.isEmpty ? const Center(child: Text('Une erreur de scan de vérification est survenue'),) :Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Center(
                                          child: CustomAvatarImage(
                                            radius: 40,
                                            imgUrl: 'https://media.istockphoto.com/id/1390650720/photo/digital-network-connection-abstract-connection-of-dots-and-lines-technology-background-plexus.webp?b=1&s=170667a&w=0&k=20&c=SUkUz3EzbbcC25vGSHdV_9MxR0Mun8giVcuHoyOKwDo=',
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customRowPopupInfo(
                                            title: DataValues.studentTitle,
                                            description: '${studentModel.firstName!} ${studentModel.middleName!} ${studentModel.lastName!}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customRowPopupInfo(
                                            title: DataValues.promotionTitle,
                                            description: studentModel.promotion!),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customRowPopupInfo(
                                            title:
                                            DataValues.academicFeesPaidTitle,
                                            description:
                                            studentModel.academicFees.toString()),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customRowPopupInfo(
                                            title: DataValues
                                                .academicFeesPaidDescription,
                                            description: DataValues
                                                .academicFeesDescription),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        studentModel.academicFees! <
                                            300
                                            ? Text(
                                          DataValues
                                              .negativeVerificationMessage,
                                          style: TextStyle(
                                              fontSize: AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
                                              fontWeight: bold,
                                              color: AppThemeData
                                                  .errorTextColor),
                                        )
                                            : Text(
                                          DataValues
                                              .positiveVerificationMessage,
                                          style: TextStyle(
                                              fontSize: AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
                                              fontWeight: bold,
                                              color:
                                              AppThemeData.textGreen),
                                        ),
                                      ],
                                    );
                                  }),
                              title: 'Vérification', onPressed: () {
                                Navigator.pop(context);
                              }, hasPaid: true);
                        });
                      } catch(e){
                        errorDialog(context, content: 'Une erreur de scan est survenue');
                      }

                    },
                    cardTitle: DataValues.homeCardTitle2,
                    isOnBlackBackground: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
