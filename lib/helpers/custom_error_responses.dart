

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_translate/flutter_translate.dart';

String customErrorResponses(Exception _error) {
  String _response = '';

  if (_error is FirebaseAuthException) {
    switch (_error.code) {
      case 'invalid-email':
        _response = translate('errors.firebase.invalidEmail');
        break;
      case 'email-already-in-use':
        _response = translate('errors.firebase.emailAlreadyInUse');
        break;
      case 'user-not-found':
        _response = translate('errors.firebase.userNotFound');
        break;
      case 'wrong-password':
        _response = translate('errors.firebase.wrongPassword');
        break;
      default:
        _response = translate('errors.firebase.unknown');
        break;
    }
  } else if (_error is DioError) {
    switch (_error.type) {
      case DioErrorType.cancel:
        _response = translate('errors.dio.requestCancelled');
        break;
      case DioErrorType.connectTimeout:
        _response = translate('errors.dio.connectionTimeOut');
        break;
      case DioErrorType.other:
        _response =
            translate('errors.dio.internetFailure');
        break;
      case DioErrorType.receiveTimeout:
        _response = translate('errors.dio.receiveTimeOut');
        break;
      case DioErrorType.response:
        _response = translate('errors.dio.invalidResponse', args: {"statusCode" : _error.response?.statusCode});
        break;
      case DioErrorType.sendTimeout:
        _response = translate('errors.dio.requestTimeOut');
        break;
      default:
        _response = translate('errors.dio.unknown');
        break;
    }
  } else if ( _error.toString() == '-1' || _error.toString() == '-2'  ){
    _response = translate('errors.custom.userNotFound');
  } else  {
    _response = translate('errors.unknown');
  }
  return _response;

}