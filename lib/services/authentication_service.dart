import 'package:bayt_test_app/helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final _result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final User? _user = _result.user;

      if (_user != null) {
        return _user;
      } else {
        throw firebaseAuthCreateUserError;
      }
    } on FirebaseAuthException catch (error) {
      throw error.message.toString();
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final _result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? _user = _result.user;

      if (_user != null) {
        return _user;
      } else {
        throw firebaseAuthSignInUserError;
      }
    } on FirebaseAuthException catch (error) {
      throw error.message.toString();
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      print('logging out');
    } on FirebaseAuthException catch (error) {
      throw error.message.toString();
    } catch (error) {
      throw error.toString();
    }
  }
}
