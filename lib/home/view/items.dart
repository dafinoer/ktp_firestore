import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktp_firestore/detail/detail.dart';
import 'package:ktp_firestore/home/home.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (_, state) {
      if (state is HomeError) {
        print('error');
        Scaffold.of(context).showSnackBar(SnackBar(
          content: const Text('Upps something wrong'),
        ));
      }
    }, buildWhen: (prev, current) {
      if (prev is HomeLoaded && current is HomeLoaded) {
        print('build = ${prev.listKTP != current.listKTP}');
        return prev.listKTP != current.listKTP;
      }
    }, builder: (_, state) {
      if (state is HomeLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is HomeLoaded) {
        if (state.listKTP.isNotEmpty) {
          return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: state.listKTP.length,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.listKTP[index].nama),
                    onTap: () {
                      Navigator.push<dynamic>(
                          context, DetailPage.detail(state.listKTP[index]));
                    },
                  ),
                );
              });
        }
        return Center(
          child: Text('Tidak ada Data'),
        );
      }

      return const SizedBox();
    });
  }
}
