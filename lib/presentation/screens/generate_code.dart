import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';

class GenerateCode extends StatelessWidget {
  const GenerateCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BarcodeWidget(
              barcode: Barcode.qrCode(
                errorCorrectLevel: BarcodeQRCorrectionLevel.high,
              ),
              data: 'Jh2ZHuD12lenzezXColp',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                child:  Text('Generer code',
                  style: TextStyle(
                    fontWeight: AppThemeData.lightTheme.textTheme.titleMedium!.fontWeight,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
