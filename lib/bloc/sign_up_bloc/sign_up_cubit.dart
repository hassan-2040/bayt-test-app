import 'package:bayt_test_app/models/local_user.dart';
import 'package:bayt_test_app/services/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUpUser({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      final _user = await AuthenticationService.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      final _localUser = LocalUser(email: _user.email!, uid: _user.uid,);

      print('user local: ${_localUser.uid} and ${_localUser.email}');

      emit(SignUpSuccess());

    } on FirebaseAuthException catch (error) {
      emit(SignUpFailure(error.message.toString()));
    } catch (error) {
      emit(SignUpFailure(error.toString()));
    }
  }
}
