import 'dart:typed_data';

import 'package:aksustack/resources/auth_method.dart';
import 'package:aksustack/utils/image_utils.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:aksustack/drop_down_spinners/department_drop_down_list/department_list.dart';
import 'package:aksustack/drop_down_spinners/drop_down.dart';
import 'package:aksustack/screens/login_page.dart';
import 'package:aksustack/utils/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailAddressTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  TextEditingController _fullNameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _regNoTextController = TextEditingController();
  Uint8List? _profileImage;
  bool _isLoading = false;

  // Str ing? departmentsDropdownValue;

  @override
  void dispose() {
    super.dispose();
    _emailAddressTextController.dispose();
    _fullNameTextController.dispose();
    _passwordTextController.dispose();
    _phoneNumberTextController.dispose();
    _regNoTextController.dispose();
    _confirmPasswordTextController.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);

    setState(() {
      _profileImage = image;
    });
  }

  void registerUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await AuthenticationClass().registerUser(
      fullName: _fullNameTextController.text,
      regNo: _regNoTextController.text,
      emailAddress: _emailAddressTextController.text,
      phoneNumber: _phoneNumberTextController.text,
      password: _confirmPasswordTextController.text,
      file: _profileImage!,
      // department: departmentsDropdownValue!,
    );
    setState(() {
      _isLoading = false;
    });
    if (result != 'success') {
      showSnackBar(result, context);
    } else {
      //
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const LoginPage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    _profileImage != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundColor: AppColors.white,
                            backgroundImage: MemoryImage(_profileImage!))
                        : const CircleAvatar(
                            radius: 64,
                            backgroundColor: AppColors.white,
                            backgroundImage: NetworkImage(
                                'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png'),
                          ),
                    Positioned(
                      bottom: 0,
                      left: 90,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                // Image.asset(
                //   'images/login.png',
                //   height: 300.0,
                //   width: 300.0,
                // ),

                //-- full name textField --
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                      textEditingController: _fullNameTextController,
                      hintText: 'Full name',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                      ),
                      textInputType: TextInputType.text),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //-- Registraion Number --
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                      textEditingController: _regNoTextController,
                      hintText: 'Reg number',
                      prefixIcon: const Icon(
                        Icons.app_registration,
                        color: AppColors.primaryColor,
                      ),
                      textInputType: TextInputType.text),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                // -- Email Text Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                      textEditingController: _emailAddressTextController,
                      hintText: 'Email address',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.primaryColor,
                      ),
                      textInputType: TextInputType.emailAddress),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                //-- Phone Number Text Field  --
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                      textEditingController: _phoneNumberTextController,
                      hintText: 'phone number',
                      prefixIcon:
                          Icon(Icons.phone, color: AppColors.primaryColor),
                      textInputType: TextInputType.phone),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                //-- Department DropDown Button --
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: AppColors.primaryColor, spreadRadius: 1),
                    ],
                  ),
                  child: const DropDown(),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                //-- Password Text Field  --
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                    textEditingController: _passwordTextController,
                    hintText: 'password',
                    prefixIcon: const Icon(
                      Icons.password,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: Icon(Icons.visibility),
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                //-- Confirm Password TextField --
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                      textEditingController: _confirmPasswordTextController,
                      hintText: 'Confirm password',
                      prefixIcon: const Icon(
                        Icons.password,
                        color: AppColors.primaryColor,
                      ),
                      textInputType: TextInputType.visiblePassword),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.05,
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : TextButton(
                            onPressed: registerUser,
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(55.0)),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF0E693E))),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Already have an account? '),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
