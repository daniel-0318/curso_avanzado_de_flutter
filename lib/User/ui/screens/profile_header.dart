import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/User.dart';
import 'package:platzi_trips_app/User/ui/screens/sign_in_screen.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class ProfileHeader extends StatelessWidget {

  late UserBloc userBloc;
  late User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            print("ConnectionState.active");
            return showProfileData(snapshot, context);
          case ConnectionState.done:
            print("ConnectionState.done");
            return showProfileData(snapshot, context);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot, BuildContext context) {
    print("tiene data " + snapshot.hasData.toString());
    print("error " + snapshot.hasError.toString());
    if(!snapshot.hasData ||snapshot.hasError){
      print("No logeado");
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            //CircularProgressIndicator(),
            Text("No se pudo cargar la información. Haz login"),
            ButtonGreen(text: "Login with Gmail", onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(BuildContext context) => SignInScreen() ));
            }, width: 200, height: 50)
          ],
        ),
      );
    }else{
      print("Logeado");
      print(snapshot.data);
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoURL);
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),
      );

      return Container(
        margin: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );

    }
  }

}