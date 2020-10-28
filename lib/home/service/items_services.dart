import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ktp_firestore/common/remote/base_remote.dart';
import 'package:ktp_firestore/home/home.dart';

class ItemsServices extends BaseRemote {
  ItemsServices()
      : super(FirebaseFirestore.instance.collection('citizen'));


  Future<List<KartuTandaPenduduk>> fetchItemLimits(int limit, String orderBy) async {
    final result = await reference.orderBy(orderBy).limit(limit).get();
    final items = result.docs.map((DocumentSnapshot e) => KartuTandaPenduduk.fromJson(e.data()),).toList();
    return items;
  }

  Future<List<KartuTandaPenduduk>> fetchQuery(int limit, String orderBy, {List value}) async {
    final result = await reference.orderBy(orderBy).limit(limit).startAfter(value).get();
    final items = result.docs.map((DocumentSnapshot e) => KartuTandaPenduduk.fromJson(e.data())).toList();
    return items;
  }

}
