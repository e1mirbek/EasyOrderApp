import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final authRepositoryProvider = Provider(
  (ref) => AuthRepository(FirebaseAuth.instance),
);

class AuthRepository {

  final FirebaseAuth _auth;
  AuthRepository(this._auth);


}
