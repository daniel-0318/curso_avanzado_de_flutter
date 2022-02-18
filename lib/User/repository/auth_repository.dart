import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/User/repository/firebaseAuthAPI.dart';

class AuthRepository{
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<auth.User> singInFirebase () => _firebaseAuthAPI.singIn();
}