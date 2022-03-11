import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget{

  final String title;

  TitleHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      width: screenWidht,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
        ),
      ),

    );
  }

}