import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../../../static/data_values.dart';
import '../../../utils/dialog_alert.dart';

class PresenceScannerTab extends StatefulWidget {
  PresenceScannerTab({Key? key, this.pageTitle}) : super(key: key);

  String? pageTitle;

  @override
  State<PresenceScannerTab> createState() => _PresenceScannerTabState();
}

class _PresenceScannerTabState extends State<PresenceScannerTab> {
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
    return BlocListener<UpdatePresenceCubit, UpdatePresenceState>(
      listener: (context, state) {
        if (state is UpdatePresenceLoading) {
          const IsLoading();
        } else if (state is UpdatePresenceLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Présence comptabilisée')));
          scanPresencePopup(context,
              content: StreamBuilder<StudentModel>(
                  stream: StudentsRepository().studentModel(scanResultFinal),
                  builder: (context, snapshot) {
                    StudentModel? studentModel = snapshot.data;
                    if (!snapshot.hasData || studentModel == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      errorDialog(context,
                          content: "Une erreur est survenue");
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            title: DataValues.academicFeesPaidTitle,
                            description: studentModel.academicFees.toString()),
                        const SizedBox(
                          height: 10,
                        ),
                        customRowPopupInfo(
                            title: DataValues.academicFeesPaidDescription,
                            description: DataValues.academicFeesDescription),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          DataValues.confirmationMessage,
                          style: TextStyle(
                            fontSize: AppThemeData
                                .lightTheme.textTheme.titleSmall!.fontSize,
                          ),
                        ),
                      ],
                    );
                  }),
              title: 'Présence', onPressed: () {
            Navigator.pop(context);
          });
        } else if (state is UpdatePresenceError) {
          errorDialog(context,
              content: 'Une erreur de scan est survenue.');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          title: BlocBuilder<DrawerCubit, String>(
            builder: (context, state) {
              return Text(state == 'P0'
                  ? 'L0'
                  : state == 'P1'
                      ? 'L1'
                      : state == 'P2'
                          ? 'L2'
                          : state == 'P3'
                              ? 'L3'
                              : state == 'P4'
                                  ? 'M1'
                                  : state == 'P5'
                                      ? 'M2'
                                      : 'L0');
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () async{
                  scanQrCode(context).whenComplete(() {
                    context
                        .read<UpdatePresenceCubit>()
                        .updatePresence(scanResultFinal);
                  });
                },
                child: Text(
                  DataValues.presencesScannerButtonTitle,
                  style: TextStyle(
                    fontWeight: AppThemeData
                        .lightTheme.textTheme.titleMedium!.fontWeight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
