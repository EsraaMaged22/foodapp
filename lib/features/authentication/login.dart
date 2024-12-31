import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/authentication/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/costants/colors.dart';
import '../../core/costants/fonts.dart';
import '../../core/widgets/customTextFormField.dart';
import '../../core/widgets/custombutton.dart';
import '../home/homescreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late var rememberPassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [ Image.asset("assets/images/foodlogo.png",width: 100,),
              Text('Welcome back !', style:GoogleFonts.lobster(color: AppColors.primaryRed,fontSize: 40 ),),

              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 30),
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
              CustomTextFormField(
                hintText: "Password",
                icon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberPassword = value!;
                            });
                          },
                          activeColor: AppColors.primaryRed,
                          side: const BorderSide(color: AppColors.primaryRed),
                        ),
                        Text('Remember me', style: AppFonts.textStyle12gray),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {
                          print("password forgotten");
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomButton(
                text: "Log In",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  } else {
                    print('Form is invalid');
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(thickness: 0.7, color: Colors.grey)),
                    Text('Or continue with',
                        style: AppFonts.textStyle16gray),
                    Expanded(
                        child: Divider(thickness: 0.7, color: Colors.grey)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 60,width: 60,
                        child: Image.asset("assets/icons/facebook.png")),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5))),
                        height: 60,width: 60,
                        child: Image.asset("assets/icons/google.png"))
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: AppColors.primaryRed,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                          print('Sign Up tapped');
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

