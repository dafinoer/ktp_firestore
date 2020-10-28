import 'package:flutter/material.dart';
import 'package:ktp_firestore/detail/view/view.dart';
import 'package:ktp_firestore/home/home.dart';
import 'package:ktp_firestore/strings.dart';

class DetailPage extends StatelessWidget {
  static Route detail(KartuTandaPenduduk ktp) => MaterialPageRoute<dynamic>(
      builder: (_) => DetailPage(
            ktp: ktp,
          ));

  const DetailPage({this.ktp});

  final KartuTandaPenduduk ktp;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(Strings.ID_KTP, style: textTheme.caption,),
              subtitle: Text(Strings.ID_KTP, style: textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title: Text(Strings.NAME_TEXTFORM, style: textTheme.caption,),
              subtitle: Text(ktp.nama, style: textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),),
            ),
            Item(
              title: Strings.DATE_OF_BIRTH,
              subtitle: '${ktp.tanggalLahir}',
            )
          ],
        ),
      )),
    );
  }
}
