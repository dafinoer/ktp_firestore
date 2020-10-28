import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktp_firestore/home/home.dart';
import 'package:ktp_firestore/home/repository/home_repository_imp.dart';

import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepositoryImp _homeRepositoryImp;

  HomeBloc(HomeRepositoryImp repositoryImp) : super(HomeLoading()) {
    add(HomeSink());
    _homeRepositoryImp = repositoryImp;

    _homeRepositoryImp.pipelineKTP().listen((event) {
      add(NewKtp(ktp: event));
    });
  }

  @override
  Future<void> close() {
    _homeRepositoryImp.close();
    return super.close();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final current = state;

    try {
      if (event is HomeSink && !isFull(state)) {
        if (current is HomeLoading) {
          final item = await _homeRepositoryImp.getItemsKtp(<dynamic>[]);
          yield HomeLoaded(listKTP: item);
        }
      }

      if (event is NewKtp) {
        if (current is HomeLoaded) {
          final tempItem = List<KartuTandaPenduduk>.from(current.listKTP);
          tempItem.add(event.ktp);
          yield current.copyWith(items: tempItem.toList());
        }
      }
    } catch (e) {
      yield HomeError();
    }
  }

  bool isFull(HomeState state) => state is HomeLoaded && state.isMax;
}
