import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/User/model/User.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

import '../../Place/model/place.dart';

class CloudFiresoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDate(Place place) => _cloudFirestoreAPI.updatePlaceDate(place);

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);

}