import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/User.dart' as userModel;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/platzi_trips.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen>{

  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream:  userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //(Snapshot - data - Object User)
        if(!snapshot.hasData || snapshot.hasError){
          return singInGoogleUI();
        }else{
          return PlatziTrips();
        }
      },
    );
  }

  Widget singInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(height: null, title: ''),
          Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Text(
                "Welcome \n This is your Travel App",
                style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc.signIn()
                      .then((UserCredential? user) {
                    userBloc.updateUserData(
                        userModel.User(
                          uid: user?.user!.uid,
                          name: (user?.user!.displayName).toString(),
                          email: (user?.user!.email).toString(),
                          photoURL: (user?.user!.photoURL).toString(),
                        )
                    );
                  });
                },
                width: 300.0,
                height: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

}