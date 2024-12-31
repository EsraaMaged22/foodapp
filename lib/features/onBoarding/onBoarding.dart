import 'package:flutter/material.dart';
import '../../core/costants/colors.dart';
import '../../core/costants/fonts.dart';
import '../authentication/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( width: double.infinity, decoration: const BoxDecoration(
    gradient: LinearGradient(
    colors: [AppColors.accentRed, AppColors.primaryRed],
    begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
    ), ),
        child: Center(child: Column(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Text("Foodgo",style: AppFonts.textStyle60white,),
          ),
          Align(alignment: Alignment.bottomLeft,
              child: Image.asset("assets/images/onboarding.png",width: 250,))],)),
      ) ,
    );
  }
}
