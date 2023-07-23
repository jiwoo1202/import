import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> firebaseTestUpload() async {
  CollectionReference ref = FirebaseFirestore.instance.collection('test');
  ref.add({
    'answer': '',
    'id': '01048544580',
    'answerDocid': '',
    'teacher': ''
  });
}