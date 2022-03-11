import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/model/User.dart' as userModel;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

import '../../Place/model/place.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //flujo de datos - Streams
  //Stream - Firebase
  //ScreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges(); //Establece o instancia que se requiere conocer el estado de la sesion en Firebase

  Stream<User?> get authStatus => streamFirebase; //Devuelve el estado de la sesion

  //Casos de uso
  //1. SignIn a la aplicacion de google
  Future<UserCredential?> signIn(){
    return _auth_repository.singInFirebase();
  }


  //2. Registrar usuario e base de datos
  final _cloudFirestoreRepository = CloudFiresoreRepository();
  void updateUserData(userModel.User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceDate(Place place) => _cloudFirestoreRepository.updatePlaceDate(place);


  signOut(){
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}