import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktp_firestore/form/bloc/bloc.dart';
import 'package:ktp_firestore/home/repository/home_repository_imp.dart';
import 'package:ktp_firestore/strings.dart';

part 'name.dart';
part 'birth.dart';
part 'gender.dart';
part 'job.dart';
part 'marriage.dart';
part 'religion.dart';
part 'alamat.dart';
part 'button.dart';

class FormPage extends StatelessWidget {
  static Route form() => MaterialPageRoute<dynamic>(builder: (_) => FormPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form'),
      ),
      body: SafeArea(
        child: BlocProvider<FormCubit>(
          create: (_) => FormCubit(context.repository<HomeRepositoryImp>()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Name(),
                        Birth(),
                        Alamat(),
                        Religion(),
                        Gender(),
                        Job(),
                        Marriage()
                      ],
                    ),
                  ),
                ),
                Button()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
