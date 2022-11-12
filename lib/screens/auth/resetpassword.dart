import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../consts/consts.dart';
import '../../widgets/custombutton.dart';
import 'register.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final GlobalKey<FormState> _resetpasswordformKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void validate({
    required String email,
    required BuildContext context,
  }) async {
    final FormState form = _resetpasswordformKey.currentState!;
    if (form.validate()) {
      // await _checkPassword(password, context);
      // log(password);
      // log(email);
    } else {
      const snackbar = SnackBar(
        content: Text("Invalid form data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _resetpasswordformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/inapplogo.png',
                      height: size.height * 0.3,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: Consts.emailValidator,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CustomButton(
                    ontap: () {
                      validate(
                        context: context,
                        email: emailController.text.trim(),
                      );
                    },
                    buttontext: 'Reset Password',
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
