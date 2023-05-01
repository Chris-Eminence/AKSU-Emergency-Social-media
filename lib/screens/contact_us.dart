import 'package:aksustack/utils/project_colors.dart';
import 'package:aksustack/utils/widgets/contact_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/widgets/user_details_widget.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: GoogleFonts.nunito(
              fontWeight: FontWeight.w600, color: AppColors.black),
        ),
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Get.back;
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(

            children: [

              Center(
                child: Text(
                    'I know you’ve been wanting to hear \nfrom\nus and the team (Hachstacks\nMission Statement here)',
                    style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              const SizedBox(height: 30,),

              /*
              Join our community Text widget
               */
              ContactUsWidget(text: 'Join our community', onTap: (){


              }),
              /*
              WhatsApp Text widget
               */
              ContactUsWidget(text: 'Whatsapp', onTap: (){}),
              /*
              Website Text widget
               */
              ContactUsWidget(text: 'Website', onTap: (){}),
              /*
              Facebook Text widget
               */
              ContactUsWidget(text: 'Facebook', onTap: (){}),
              /*
              Twitter Text widget
               */
              ContactUsWidget(text: 'Twitter', onTap: (){}),
              /*
              Instagram Text widget
               */
              ContactUsWidget(text: 'Instagram', onTap: (){}),

              const SizedBox(height: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('App developed by Hachstacks'),
                  Text('Copyright 2023'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
