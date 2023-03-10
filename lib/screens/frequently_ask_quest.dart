import 'package:aksustack/utils/project_colors.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions({
    Key? key,
  }) : super(key: key);

  @override
  State<FrequentlyAskedQuestions> createState() =>
      _FrequentlyAskedQuestionsState();
}

class _FrequentlyAskedQuestionsState extends State<FrequentlyAskedQuestions> {
  List<bool> _isOpen = [false, false, false];

  final List<Map<String, String>> _faqs = [
    {
      "question": "What is Flutter?",
      "answer":
          "Flutter is a free and open-source mobile application development framework created by Google. It allows you to build beautiful and natively-compiled applications for mobile, web, and desktop from a single codebase.",
    },
    {
      "question": "How is Flutter different from other frameworks?",
      "answer":
          "Flutter is different from other frameworks because it uses a reactive programming model. This means that your code responds to changes in the state of your application and automatically updates the user interface to reflect those changes. Additionally, Flutter offers a rich set of pre-built widgets and tools that allow you to create beautiful, high-performance applications quickly and easily.",
    },
    {
      "question": "What programming languages can I use with Flutter?",
      "answer":
          "Flutter uses the Dart programming language, which is also developed by Google. Dart is an object-oriented, garbage-collected language that is designed to be easy to learn and fast to execute. You can use Dart to write both the client and server-side code for your application, which makes it a versatile and powerful language for mobile app development.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isOpen[index] = !isExpanded;
              });
            },
            children: _faqs.map((faq) {
              int index = _faqs.indexOf(faq);
              return ExpansionPanel(
                backgroundColor: AppColors.secondaryColor,
                isExpanded: _isOpen[index],
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      faq['question']!,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(faq['answer']!),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
