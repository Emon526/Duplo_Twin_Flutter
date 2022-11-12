import 'dart:developer';

import 'package:duplotwin/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../consts/consts.dart';
import '../../widgets/custombutton.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final transctionController = TextEditingController();
  final invitationController = TextEditingController();

  final GlobalKey<FormState> _registerformKey = GlobalKey<FormState>();
  bool isObsecured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    transctionController.dispose();
    invitationController.dispose();
    super.dispose();
  }

  void validate({
    required String email,
    required String password,
    required String confirmpassword,
    required String transactionpassword,
    required String invitationcode,
    required BuildContext context,
  }) async {
    final FormState form = _registerformKey.currentState!;
    if (form.validate()) {
      // await _checkPassword(password, context);

      log(email);
      log(password);
      log(confirmpassword);
      log(transactionpassword);
      log(invitationcode);
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
              key: _registerformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/inapplogo.png',
                      height: size.height * 0.2,
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: Consts.emailValidator,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    obscureText: isObsecured,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // validator: Consts.passwordValidator,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffix: InkWell(
                        child: Icon(
                          isObsecured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onTap: () {
                          setState(() {
                            isObsecured = !isObsecured;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    obscureText: isObsecured,
                    controller: confirmpasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // validator: Consts.passwordValidator,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffix: InkWell(
                        child: Icon(
                          isObsecured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onTap: () {
                          setState(() {
                            isObsecured = !isObsecured;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    obscureText: isObsecured,
                    controller: transctionController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // validator: Consts.passwordValidator,
                    decoration: InputDecoration(
                      labelText: 'Transcation Password',
                      suffix: InkWell(
                        child: Icon(
                          isObsecured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onTap: () {
                          setState(() {
                            isObsecured = !isObsecured;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    controller: invitationController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    // validator: Consts.passwordValidator,
                    decoration: const InputDecoration(
                      labelText: 'Invitation Code',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomButton(
                    ontap: () {
                      // validate(
                      //   context: context,
                      //   email: emailController.text.trim(),
                      //   password: passwordController.text.trim(),
                      //   confirmpassword: confirmpasswordController.text.trim(),
                      //   transactionpassword: transctionController.text.trim(),
                      //   invitationcode: invitationController.text.trim(),
                      // );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const HomePage(),
                      //   ),
                      // );
                    },
                    buttontext: 'Register',
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  RichText(
                    selectionColor: Colors.amber,
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
