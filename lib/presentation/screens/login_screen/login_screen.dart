import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/utils/utils.dart';

import '../../../static/data_values.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is Loaded){
          snackBarMessenger(context: context, content: DataValues.welcomeText, color: AppThemeData.primaryColor);
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        } else if (state is Error){
          errorDialog(context, content: CustomError(message: state.message.toString()));
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DataValues.loginTitle,
                  style: TextStyle(
                    color: AppThemeData.primaryColor,
                    fontSize:
                    AppThemeData.lightTheme.textTheme.displayMedium!.fontSize,
                    fontWeight: AppThemeData
                        .lightTheme.textTheme.displaySmall!.fontWeight,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DataValues.loginDescription,
                  style: TextStyle(
                    color: AppThemeData.primaryColor,
                    fontSize:
                    AppThemeData.lightTheme.textTheme.titleLarge!.fontSize,
                    fontWeight: AppThemeData
                        .lightTheme.textTheme.displaySmall!.fontWeight,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: loginTextFieldsDecoration(
                      hintText: DataValues.emailHintAndLabel,
                      labelText: DataValues.emailHintAndLabel),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: loginTextFieldsDecoration(
                      hintText: DataValues.passwordHintAndLabel,
                      labelText: DataValues.passwordHintAndLabel),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 60,
                    child: BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return ElevatedButton(
                      onPressed: state is Loading ? (){} : () {
                         context.read<LoginCubit>().login(email: _email.text.trim(), password: _password.text.trim());
                      },
                      child: Text(
                        state is Loading ? DataValues.waitingText : DataValues.loginElevatedButtonTitle,
                        style: TextStyle(
                          fontSize: AppThemeData
                              .lightTheme.textTheme.titleMedium!.fontSize,
                          fontWeight: AppThemeData
                              .lightTheme.textTheme.titleMedium!.fontWeight,
                        ),
                      ),
                    );
  },
)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
