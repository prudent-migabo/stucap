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
        onBackEvent: (){},
        title: 'Lo',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                popupForScanPresenceAction(
                  context,
                  title: 'Scan présence',
                  content: Column(
                    children: [
                      Text("L'étudian MIKA BORONINA"),
                      Text("De LO"),
                      Text("A payé 300\$"),
                      Text("Est présent aujourd'hui"),
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
