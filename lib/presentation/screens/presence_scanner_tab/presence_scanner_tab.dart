import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/presentation/presentation.dart';

import '../../../static/data_values.dart';
import '../../../utils/dialog_alert.dart';

class PresenceScannerTab extends StatelessWidget {
   const PresenceScannerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onBackEvent: (){
          Navigator.pop(context);
        },
        title: 'Lo',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                scanVerificationPopup(
                  context,
                  title: customCheckCard(
                    isTrue: false,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customRowPopupInfo(title: DataValues.studentTitle, description: DataValues.studentName),
                      const SizedBox(height: 10,),
                      customRowPopupInfo(title: DataValues.promotionTitle, description: DataValues.promotionDescription),
                      const SizedBox(height: 10,),
                      customRowPopupInfo(title: DataValues.academicFeesPaidTitle, description: DataValues.academicFeesDescription),
                      const SizedBox(height: 10,),
                      customRowPopupInfo(title: DataValues.academicFeesPaidDescription, description: DataValues.academicFeesDescription),
                      const SizedBox(height: 10,),
                      const Text(DataValues.confirmationVerificationMessage),
                    ],
                  ),
                );

              },
              child:  Text(DataValues.presencesScannerButtonTitle, style: TextStyle(
                 fontWeight: AppThemeData.lightTheme.textTheme.titleMedium!.fontWeight,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
