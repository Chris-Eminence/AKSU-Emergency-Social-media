import 'package:flutter/material.dart';
import '../../utils/widgets/user_details_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/profile_cover.png'),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/user_avaterr.png'),
                              radius: 40,
                            ),
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15.0),
                          //         color: Colors.grey.shade200,
                          //       ),
                          //       padding: const EdgeInsets.all(15),
                          //       child: Row(
                          //         children: [
                          //           Row(
                          //             children: [
                          //               Text('Following: ',
                          //                   style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                          //
                          //               Text('0',
                          //                   style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                          //             ],
                          //           ),
                          //
                          //         ],
                          //       ),
                          //     ),
                          //     const SizedBox(width: 20,),
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15.0),
                          //         color: Colors.grey.shade200,
                          //       ),
                          //       padding: const EdgeInsets.all(15),
                          //       child: Row(
                          //         children: [
                          //           Row(
                          //             children: [
                          //               Text('Followers: ',
                          //                   style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                          //
                          //               Text('0',
                          //                   style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                          //             ],
                          //           ),
                          //
                          //         ],
                          //       ),
                          //     ),
                          //
                          //   ],
                          // ),
                          /*
              Name Container
               */
                          SizedBox(
                            height: 0,
                          ),
                          UserDetailsWidget(
                            title: 'Name',
                            body: 'Username Here',
                          ),
                          /*
              Bio Container
               */
                          SizedBox(
                            height: 20,
                          ),
                          UserDetailsWidget(
                            title: 'Bio',
                            body:
                                'I know a lot of people face challenges that may require them coming over to find solace with you, but you know what, don\'t let someone that\'s sinking to take you along. Stay safe first before stretching.',
                          ),
                          /*
              campus Container
               */
                          SizedBox(
                            height: 20,
                          ),
                          UserDetailsWidget(
                            title: 'Date of birth',
                            body: '11 - 11 - 2011',
                          ),

                          /*
                          campus Container
                          */
                          SizedBox(
                            height: 20,
                          ),
                          UserDetailsWidget(
                            title: 'Campus',
                            body: 'Campus here',
                          ),
                          /*
                          Department Container
                          */
                          SizedBox(
                            height: 20,
                          ),
                          UserDetailsWidget(
                            title: 'Department',
                            body: 'Department here',
                          ),
                          /*
                          Department Container
                          */
                          SizedBox(
                            height: 20,
                          ),
                          UserDetailsWidget(
                            title: 'Gender',
                            body: 'Male',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
