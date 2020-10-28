import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktp_firestore/home/home.dart';
import 'package:ktp_firestore/home/repository/home_repository_imp.dart';
import 'home/view/view.dart';

class App extends StatelessWidget {

  final _homeRepo = HomeRepositoryImp(ItemsServices());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<HomeRepositoryImp>.value(
      value: _homeRepo,
      child: BlocProvider<HomeBloc>(
        create:(_) => HomeBloc(_homeRepo), child: MaterialApp(
        home: HomePage(),
      ),)
    );
  }
}
