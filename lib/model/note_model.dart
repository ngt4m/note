import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String? id;
  final String? title;
  final String? body;
  final int? color;

  NoteModel({this.id, this.title, this.body, this.color});

  factory NoteModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return NoteModel(
      id: snapshot['id'],
      title: snapshot['title'],
      body: snapshot['body'],
      color: snapshot['color'],
    );
  }
  Map<String, dynamic> toDocument() => {
        'id': id,
        'title': title,
        'body': body,
        'color': color,
      };
}
