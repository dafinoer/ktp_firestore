import 'package:equatable/equatable.dart';
import 'package:ktp_firestore/home/home.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomeLoaded extends HomeState {
  final List<KartuTandaPenduduk> listKTP;
  final bool isMax;
  HomeLoaded({this.listKTP, this.isMax});

  @override
  List<Object> get props => <Object>[listKTP, isMax];

  HomeLoaded copyWith({List<KartuTandaPenduduk> items, bool isMax}) {
    return HomeLoaded(
        listKTP: items ?? this.listKTP, isMax: isMax ?? this.isMax);
  }
}
