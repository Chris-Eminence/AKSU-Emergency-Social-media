import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dimension extends StatefulWidget {
  const Dimension({Key? key}) : super(key: key);

  @override
  State<Dimension> createState() => _DimensionState();
}

class _DimensionState extends State<Dimension> {


  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container();
  }
}