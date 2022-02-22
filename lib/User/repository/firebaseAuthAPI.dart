import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> singIn() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();  //aparece ventana o cuadro de dialogo para seleccionar cuenta de Google
    GoogleSignInAuthentication gSA = await googleSignInAccount!.authentication;

    UserCredential userCredential = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(idToken: gSA.idToken, accessToken: gSA.accessToken));
    return userCredential;

  }

  void SignOut() async {
    await _auth.signOut().then((onValue) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }


}