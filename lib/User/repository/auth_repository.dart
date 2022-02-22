import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/firebaseAuthAPI.dart';

class AuthRepository{
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<UserCredential?> singInFirebase () => _firebaseAuthAPI.singIn();

  signOut() => _firebaseAuthAPI.SignOut();
}