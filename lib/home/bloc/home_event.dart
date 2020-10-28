


import 'package:ktp_firestore/home/home.dart';

abstract class HomeEvent {
  const HomeEvent();
}


class HomeSink extends HomeEvent {
  final KartuTandaPenduduk ktp;
  HomeSink({this.ktp});
}


class NewKtp extends HomeEvent {
  final KartuTandaPenduduk ktp;
  NewKtp({this.ktp});
}