import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class  CardImage extends StatelessWidget {

  String pathImage = "assets/img/beach.jpeg";
  double height;
  double width;
  double left;
  VoidCallback onPressedFabIcon;
  final IconData iconData;

  CardImage({required this.pathImage,required this.height,required this.width,required this.left, required this.onPressedFabIcon,required this.iconData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: pathImage.contains('assets') ? AssetImage(pathImage)
                :  FileImage( File(pathImage)) as ImageProvider,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData, onPressed: onPressedFabIcon,)
      ],
    );
  }

}