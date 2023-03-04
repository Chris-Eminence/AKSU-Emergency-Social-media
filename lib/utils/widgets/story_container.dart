import 'package:flutter/material.dart';

import '../project_colors.dart';

class StoryContainer extends StatelessWidget {
  const StoryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2.5,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Image.asset(
        'images/tina_up.png',
        width: 40,
        height: 40,
      ),
    );
  }
}
