import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_colors.dart';

class PersonalInfoNavWidget extends StatelessWidget {

  final IconData firstIcon;
  final String label;
  final IconData? endIcon;
  const PersonalInfoNavWidget({
    super.key, required this.firstIcon, required this.label, this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: AppColors.grey,
                  child: Icon(firstIcon, color: AppColors.primaryColor,)),
              const SizedBox(width: 20,),
              Text(label, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 21),),
            ],
          ),
          Icon(endIcon)
        ],
      ),
    );
  }
}
