import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_colors.dart';

class UserLabelHomePage extends StatelessWidget {
  final String circleAvatar;
  final String userName;
  final IconData verifiedBadge;
  final IconData optionsIcon;

  const UserLabelHomePage({
    super.key,
    required this.circleAvatar,
    required this.userName,
    required this.verifiedBadge,
    required this.optionsIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 2, color: Colors.grey.shade300),
      )
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(circleAvatar),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName,
                      style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                  Text('2hrs', style: GoogleFonts.inter(fontSize: 8.5),)
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                verifiedBadge,
                color: AppColors.primaryColor,
                size: 10,
              ),
            ],
          ),
          Icon(
            optionsIcon,
            color: AppColors.primaryColor,
            size: 16,
          ),
        ],
      ),
    );
  }
}
