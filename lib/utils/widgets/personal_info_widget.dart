import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_colors.dart';

class PersonalInfoNavWidget extends StatelessWidget {
  final IconData firstIcon;
  final String label;
  final IconData? endIcon;
  final GestureTapCallback? onTap;

  const PersonalInfoNavWidget({
    Key? key,
    required this.firstIcon,
    required this.label,
    this.endIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gestureDetector = GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.grey,
                  child: Icon(
                    firstIcon,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  label,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
            Icon(endIcon),
          ],
        ),
      ),
    );

    return gestureDetector;
  }
}
