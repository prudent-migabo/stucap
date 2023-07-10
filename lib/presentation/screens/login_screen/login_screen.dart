import 'package:flutter/material.dart';

import '../../../static/data_values.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('STUCAP', style: Theme.of(context).textTheme.displaySmall,),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: DataValues.emailHintAndLabel,
                  labelText: DataValues.emailHintAndLabel,
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: DataValues.passwordHintAndLabel,
                  labelText: DataValues.passwordHintAndLabel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
