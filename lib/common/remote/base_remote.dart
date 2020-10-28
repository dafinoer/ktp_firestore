import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRemote {
  CollectionReference _collectionReference;

  BaseRemote(this._collectionReference);

  Future<void> create(Map<String, dynamic> data) async {
    await _collectionReference.add(data);
    return;
  }
  
  CollectionReference get reference => _collectionReference;
}
