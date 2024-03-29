import 'package:aksustack/screens/contact_us.dart';
import 'package:aksustack/screens/frequently_ask_quest.dart';
import 'package:aksustack/screens/profile_screens/profile_screen.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/widgets/personal_info_widget.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                /*
                Banner image
                 */
                Center(child: Image.asset('images/cover_image.png')),
                const SizedBox(height: 7),
                Text('Send a DM for ads placement', style: GoogleFonts.nunito(color: AppColors.secondaryColor),),

                /*
                personal info button
                 */
                const SizedBox(height: 20,),
                PersonalInfoNavWidget(
                  firstIcon: Icons.person,
                  label: 'Personal Info',
                  endIcon: Icons.navigate_next,
                   onTap: (){
                     Get.to(() => const ProfileScreen());
                   },

                ),

                /*
                security button
                 */
                const PersonalInfoNavWidget(
                  firstIcon: Icons.security,
                  label: 'Security',
                  endIcon: Icons.navigate_next,

                ),

                /*
                Dark mode toggle button
                 */
                const PersonalInfoNavWidget(
                  firstIcon: Icons.dark_mode,
                  label: 'Dark Mode ',
                  endIcon: Icons.toggle_off_outlined,

                ),

                /*
                FAQ button
                 */
                PersonalInfoNavWidget(
                  firstIcon: Icons.question_answer_outlined,
                  label: 'FAQ',
                  endIcon: Icons.navigate_next,
                  onTap: (){Get.to(() => const FrequentlyAskedQuestions()); }

                ),

                /*
                contact us button
                 */
                 PersonalInfoNavWidget(
                  firstIcon: Icons.contact_page,
                  label: 'Contact Us',
                  onTap: (){Get.to(() => const ContactUs()); },
                  endIcon: Icons.navigate_next,

                ),

                /*
                about us button
                 */
                const PersonalInfoNavWidget(
                  firstIcon: Icons.info,
                  label: 'About Us',
                  endIcon: Icons.navigate_next,

                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

