import 'package:aksustack/repository/authentication_repo/authenticstion_repo.dart';
import 'package:aksustack/screens/emergency_form.dart';
import 'package:aksustack/screens/profile_screens/profile_screen.dart';
import 'package:aksustack/screens/profile_screens/settings.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:aksustack/utils/widgets/user_label_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/widgets/story_container.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onDoubleTap: (){
          print(' this has been doubled tapped');
        },
        child: FloatingActionButton(
          onPressed: () {
            // Add your code here to define what should happen when the FAB is pressed.
            print('this is a single tap');
            Get.to(() => const EmergencyForm());
          },
          backgroundColor: Colors.blue,
          child: Image.asset('images/fab.png'),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Hachstacks',
            style: GoogleFonts.nunito(
                color: AppColors.black, fontWeight: FontWeight.bold)),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.person,
                  size: 18,
                  color: AppColors.primaryColor,
                  ),
                  onPressed: () { Get.to(() => const ProfileScreen()); },
                ),

                IconButton(
                  icon: const Icon(Icons.settings,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () { Get.to(() => const SettingsScreens(),); },
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.send,
                  size: 18,
                  color: AppColors.primaryColor,
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Story Feature container
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    StoryContainer(),
                    SizedBox(
                      width: 10,
                    ),
                    StoryContainer(),
                    SizedBox(
                      width: 10,
                    ),
                    StoryContainer(),
                    SizedBox(
                      width: 10,
                    ),
                    StoryContainer(),
                    SizedBox(
                      width: 10,
                    ),
                    StoryContainer(),
                    SizedBox(
                      width: 10,
                    ),
                    StoryContainer(),
                    SizedBox(
                      width: 10,
                    ),
                    StoryContainer(),
                    SizedBox(
                      width: 10,
                    ),
                    StoryContainer(),
                  ],
                ),
              ),
            ),

            // What's happening in your campus?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade200,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset('images/tina_up.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('What\'s happening in your campus?',
                            style: GoogleFonts.nunito()),
                      ],
                    ),
                    const Icon(
                      Icons.image,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            const UserLabelHomePage(
              circleAvatar: 'images/vic.png',
              userName: 'Hachstacks Tech Community',
              verifiedBadge: Icons.verified,
              optionsIcon: Icons.more_vert,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('Lorem ipsum'),
                ),
                Container(
                    child: Image.asset(
                  'images/hachstacks.png',
                  fit: BoxFit.contain,
                )),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: const [
                      Icon(Icons.thumb_up_alt_outlined, color: AppColors.primaryColor, size: 18,),
                      SizedBox(width: 10,),
                      Icon(Icons.reply_all_sharp, color: AppColors.primaryColor, size: 18),

                      SizedBox(width: 10,),
                      Icon(Icons.mode_comment, color: AppColors.primaryColor, size: 18)
                    ],
                  ),
                ),
              ],
            ),

            GestureDetector(
              child: Text(
                'Homepage still under development',
                style: TextStyle(fontSize: 30.0, color: Colors.grey.shade300),
              ),
              onDoubleTap: () {
                AuthenticationRepository().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
