import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/User.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class CloudFiresoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

}