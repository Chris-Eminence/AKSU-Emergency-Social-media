import 'package:flutter/material.dart';

class forget_password_button extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String title, subtitle;

  const forget_password_button({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade200),
        child: Row(children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20,
                ),
              ),
              Text(
                subtitle,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
