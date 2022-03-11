import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

import '../../model/place.dart';

class AddPlaceScreen extends StatefulWidget{

  File image;

  AddPlaceScreen({Key? key, required this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen>{
  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    final _controllerLocationPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(title: "", height: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 25.0,
                    left: 5.0
                ),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),

              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 10.0, right: 10.0),
                  child: TitleHeader(title:"Add a new Place"),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: 120.0,
                bottom: 20.0
            ),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImage(pathImage: widget.image.path, iconData: Icons.camera_alt, height: 200, width: 200, left: 20, onPressedFabIcon: (){}),
                ), //Foto
                Container(
                  margin: EdgeInsets.only(
                      top: 20,
                      bottom: 20.0
                  ),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    controller: _controllerTitlePlace,
                    maxLines: 1,
                  ),
                ),
                TextInput(
                  inputType: TextInputType.multiline,
                  hintText: "Description",
                  controller: _controllerDescriptionPlace,
                  maxLines: 4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add Location",
                    iconData: Icons.location_on_outlined,
                    controller: _controllerLocationPlace,

                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: (){
                      //1. Firebase Storage
                      //url -

                      //2. Cloud Firestore
                      //Place - title, description, url, userOwner, likes
                      userBloc.updatePlaceDate(Place(
                        name: _controllerTitlePlace.text,
                        description: _controllerDescriptionPlace.text,
                        likes: 0,
                        urlImage: ""
                      )).whenComplete((){
                        print("Termino");
                        Navigator.pop(context);
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}