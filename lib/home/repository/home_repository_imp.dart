import 'dart:async';

import 'package:ktp_firestore/home/home.dart';
import 'package:ktp_firestore/value.dart';

import 'home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  ItemsServices _itemsServices;

  HomeRepositoryImp(this._itemsServices);

  final controller = StreamController<KartuTandaPenduduk>();

  @override
  Future<List<KartuTandaPenduduk>> getItemsKtp(List<dynamic> value) async {
    try {
      if (value == null) {
        final item = await _itemsServices.fetchItemLimits(10, Value.PARAM_CREATED_AT);
        return item;
      } else {
        final item = await _itemsServices.fetchQuery(10, Value.PARAM_CREATED_AT, value: value);
        return item;
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Stream<KartuTandaPenduduk> pipelineKTP() => controller.stream;

  void close() {
    controller.close();
  }
}
