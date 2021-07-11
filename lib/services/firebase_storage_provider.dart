import '../pages.dart';
import 'package:firebase_storage/firebase_storage.dart';
export 'package:firebase_storage/firebase_storage.dart';

final firebaseStorageProvider = Provider((ref) => FirebaseStorage.instance);
