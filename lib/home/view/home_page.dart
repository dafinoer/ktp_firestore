import 'package:flutter/material.dart';
import 'package:ktp_firestore/form/form.dart';
import 'package:ktp_firestore/home/home.dart';
import 'package:ktp_firestore/strings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.HOME),
      ),
      body: Items(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push<dynamic>(
          context,
          FormPage.form(),
        ),
      ),
    );
  }
}
