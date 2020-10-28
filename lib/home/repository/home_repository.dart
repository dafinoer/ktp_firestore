


import 'package:ktp_firestore/home/home.dart';

abstract class HomeRepository {
  Future<List<KartuTandaPenduduk>> getItemsKtp(List<dynamic> value);
}