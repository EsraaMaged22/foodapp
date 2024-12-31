import 'package:flutter/material.dart';
import 'package:food_delivery/features/home/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/costants/colors.dart';
import '../../core/costants/fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen()),
          );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text('Profile',style: GoogleFonts.workSans( fontSize: 24,color:  Color(0xff242424),fontWeight: FontWeight.w500)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                children: [

                  SizedBox(width: 16),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Column( mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/profile.png'),
                          ),
                          Text(' Tamer',style: AppFonts.textStyle16black),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20),

              // Personal Info Section
              ExpansionTile(
                title: Text('Personal Info',style: GoogleFonts.workSans( fontSize: 20,color:  AppColors.primaryRed,fontWeight: FontWeight.w500) ),
                children: const [
                  ListTile(
                    leading: Icon(Icons.email,color: AppColors.accentRed),
                    title: Text('tamer22@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone,color: AppColors.accentRed),
                    title: Text('01000289058'),
                  ),
                ],
              ),

              // Main Actions
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.list_alt_outlined,color: AppColors.accentRed ),
                title: Text('My Orders',style: GoogleFonts.workSans( fontSize: 16,color:  Color(0xff242424),fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.payment,color: AppColors.accentRed),
                title: Text('Payment Method',style: GoogleFonts.workSans( fontSize: 16,color:  Color(0xff242424),fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.accentRed),
                title: Text('Favorites',style: GoogleFonts.workSans( fontSize: 16,color:  Color(0xff242424),fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                },
              ),

              // Settings Section
              SizedBox(height: 20),
              ExpansionTile(
                title: Text('Settings',style: GoogleFonts.workSans( fontSize: 20,color:  AppColors.primaryRed,fontWeight: FontWeight.w500)),
                children: [
                  ListTile(
                    leading: Icon(Icons.privacy_tip,color: AppColors.accentRed,),
                    title: Text('Privacy',style: AppFonts.textStyle16black),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info,color: AppColors.accentRed,),
                    title: Text('Information',style: AppFonts.textStyle16black,),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help,color: AppColors.accentRed,),
                    title: Text('Help',style: AppFonts.textStyle16black),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}