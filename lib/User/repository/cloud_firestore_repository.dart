import 'package:platzi_trips_app/User/model/User.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

import '../../Place/model/place.dart';

class CloudFiresoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDate(Place place) => _cloudFirestoreAPI.updatePlaceDate(place);

}