import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseriverpodtut/services/auth_services.dart';
import 'package:flutter_riverpod/all.dart';

final firebaseInstanceProvider = Provider<FirebaseAuth>((ref)=> FirebaseAuth.instance);
final authServicesProviders = Provider<AuthenticationService>((ref){
  return AuthenticationService(ref.read(firebaseInstanceProvider));
});
final authState = StreamProvider<User>((ref){
  return ref.watch(authServicesProviders).currentUser;
});