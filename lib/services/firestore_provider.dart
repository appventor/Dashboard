import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final firestoreIdProvider = Provider.autoDispose<String>((ref) {
  DocumentReference<Map<String, dynamic>> data =
      ref.read(firestoreProvider).collection('config').doc();
  return data.id;
});
