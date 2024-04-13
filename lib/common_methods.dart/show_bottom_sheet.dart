import 'package:flutter/material.dart';

Future<dynamic> myBottomSheet(context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return const Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
          ListTile(
            leading: Icon(Icons.copy),
            title: Text('Copy Link'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ],
      );
    },
  );
}