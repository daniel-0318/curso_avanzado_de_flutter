import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/User/model/User.dart';

class CloudFirestoreAPI{
  final String USERS = "users";
  final String PLACE = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'muFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

}