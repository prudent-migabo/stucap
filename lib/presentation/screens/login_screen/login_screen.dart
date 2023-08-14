import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/utils/utils.dart';

import '../../../static/constants.dart';
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
        if (state is LoginLoaded){
          successToast(message: 'Bienvenue');
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        } else if (state is LoginError){
          errorDialog(context, content: CustomError(message: state.message.toString()));
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal:25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DataValues.loginTitle,
                  style: TextStyle(
                    color: AppThemeData.primaryColor,
                    fontSize:
                    AppThemeData.lightTheme.textTheme.displayMedium!.fontSize,
                    fontWeight:
                    AppThemeData
                        .lightTheme.textTheme.titleLarge!.fontWeight,
                  ),
                ),
                Text(
                  DataValues.loginDescription,
                  style: TextStyle(
                    color: AppThemeData.primaryColor,
                    fontSize:
                    AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: DataValues.emailHintAndLabel,
                    labelText: DataValues.emailHintAndLabel,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: const InputDecoration(
                    hintText: DataValues.passwordHintAndLabel,
                    labelText: DataValues.passwordHintAndLabel,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 50,
                    child: BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return
      CustomButton(
                      onPressed: state is LoginLoading ? (){} : () {
                         context.read<LoginCubit>().login(email: _email.text.trim(), password: _password.text.trim());
                      },
                      text: state is LoginLoading ? DataValues.waitingText : DataValues.loginElevatedButtonTitle,
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
