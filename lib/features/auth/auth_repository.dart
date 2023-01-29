import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepository {
  Future<String?> generateAuthToken();
  Future<String?> anonymousAuth();
  Future<String?> mergeAuth();
  Future<bool> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl(this.firebaseAuth);
  @override
  Future<String?> generateAuthToken() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(credential);
      return await userCredential.user?.getIdToken();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> anonymousAuth() async {
    try {
      final userCredential = await firebaseAuth.signInAnonymously();
      return userCredential.user?.uid;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> mergeAuth() async {
    try {
      if ((firebaseAuth.currentUser?.isAnonymous ?? false) == false && firebaseAuth.currentUser != null) {
        final idToken = await generateAuthToken();
        final credential = GoogleAuthProvider.credential(idToken: idToken);
        final userCredential =
            await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        return userCredential?.user?.uid;
      } else {
        return await anonymousAuth();
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    await firebaseAuth.signOut();
    return true;
  }
}
