import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //flujo de datos - Streams
  //Stream - Firebase
  //ScreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges(); //Establece o instancia que se requiere conocer el estado de la sesion en Firebase

  Stream<User?> get authStatus => streamFirebase; //Devuelve el estado de la sesion

  //Casos de uso
  //1. SignIn a la aplicacion de google
  Future<UserCredential?> singIn(){
    return _auth_repository.singInFirebase();
  }

  signOut(){
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}