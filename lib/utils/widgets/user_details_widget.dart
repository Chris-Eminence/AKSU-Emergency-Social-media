
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_colors.dart';

class userDetailsWidget extends StatelessWidget {
  final String title;
  final String body;

  const userDetailsWidget({
    super.key, required this.title, required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: AppColors.greyShade)),
          Text(body, style: GoogleFonts.nunito(fontWeight: FontWeight.w600)),
        ],
      )


    );
  }
}
