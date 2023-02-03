import 'package:aksustack/colors/project_colors.dart';
import 'package:aksustack/drop_down_spinners/department_drop_down_list/department_list.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Department';


  List <String> spinnerItems = [
    'Department',
    'Mechanical Engineering',
    'Physics Education',
    'Chemistry Education',
    'Biology Education',
    'Marine Biology',
    'Genetics & Biotechnology',
    'Civil Engineering',
    'Micro Biology',
    'Social Science',
    'Political Science'

  ] ;

  @override
  Widget build(BuildContext context) {
    return Row(


        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.school, color: AppColors.greenColor,
            ),
          ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),

        child: DropdownButton(
          iconEnabledColor: Colors.white,
          value: dropdownValue,
          style: TextStyle(color: AppColors.greenColor, fontSize: 16),
          underline: Container(

            height: 0,
            color: AppColors.greenColor,
          ),
          onChanged: (data) {
            setState(() {
              dropdownValue = data.toString();
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


    ]);
  }
}
