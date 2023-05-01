import 'package:aksustack/utils/project_colors.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? departmentsDropdownValue;

  List<String> spinnerItems = [
    'Mechanical Engineering',
    'Physics Education',
    'Chemistry Education',
    'Biology Education',
    'Marine Biology',
    'Marine Biology',
    'Genetics & Biotechnology',
    'Civil Engineering',
    'Micro Biology',
    'Social Science',
    'Political Science'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.school,
            color: AppColors.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton(
            hint: const Text('Select your department'),
            iconEnabledColor: Colors.white,
            value: departmentsDropdownValue,
            style: const TextStyle(color: AppColors.primaryColor, fontSize: 16),
            underline: Container(
              height: 0,
              color: AppColors.primaryColor,
            ),
            onChanged: (data) {
              setState(() {
                departmentsDropdownValue = data.toString();
              });
            },
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
