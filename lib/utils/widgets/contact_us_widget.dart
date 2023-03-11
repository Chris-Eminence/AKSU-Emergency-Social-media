
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_colors.dart';

class ContactUsWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ContactUsWidget({
    super.key, required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 25, left: 30, right: 30),
          padding: EdgeInsets.all(20),
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(text, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
            ],
          )


      ),
    );
  }
}
