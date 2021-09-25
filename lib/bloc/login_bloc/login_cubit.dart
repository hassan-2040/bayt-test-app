import 'package:bayt_test_app/models/local_user.dart';
import 'package:bayt_test_app/services/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final _user = await AuthenticationService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final _localUser = LocalUser(email: _user.email!, uid: _user.uid,);

      print('user local: ${_localUser.uid} and ${_localUser.email}');

      emit(LoginSuccess());

    } on FirebaseAuthException catch (error) {
      emit(LoginFailure(error.message.toString()));
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
