import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({this.title, this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(
        title,
        style: textTheme.caption,
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
