import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/costants/colors.dart';
import '../../core/costants/fonts.dart';
import '../../core/widgets/customTextFormField.dart';
import '../../core/widgets/custombutton.dart';
import '../home/homescreen.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late var agreeTerm = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset('assets/images/foodlogo.png',width: 100,),
              ),
              Text('Create Account', style:GoogleFonts.lobster(color: AppColors.primaryRed,fontSize: 40 ),),
              Padding(
                padding: const EdgeInsets.only(bottom: 6,top: 10),
                child: CustomTextFormField(
                  hintText: 'Full name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your full name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: CustomTextFormField(
                  hintText: 'Email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: CustomTextFormField(
                  hintText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: CustomTextFormField(
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your password';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: agreeTerm,
                    onChanged: (bool? value) {
                      setState(() {
                        agreeTerm = value!;
                      });
                    },
                    activeColor: AppColors.accentRed,
                    side: BorderSide(color: Colors.grey),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "I agree to the ",
                      style: GoogleFonts.workSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'term of used',
                          style: GoogleFonts.workSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('term of use');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(
                text: "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate() && agreeTerm) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  } else if (!agreeTerm) {
                    print('You must agree to the terms of use');
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(
                            thickness: 0.7, color: Colors.grey)),
                    Text('Or continue with',
                        style: AppFonts.textStyle16gray),
                    Expanded(
                        child: Divider(
                            thickness: 0.7, color: Colors.grey)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 60,
                        child: Image.asset("assets/icons/facebook.png")),
                    SizedBox(width: 20),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5))),
                        height: 60,
                        child: Image.asset("assets/icons/google.png")),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        color: AppColors.primaryRed,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                          print('Login tapped');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
