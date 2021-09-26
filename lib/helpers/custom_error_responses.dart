

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

String customErrorResponses(Exception _error) {
  String _response = '';

  if (_error is FirebaseAuthException) {
    switch (_error.code) {
      case 'invalid-email':
        _response = 'Invalid Email Provided. Please use your correct email.';
        break;
      case 'email-already-in-use':
        _response = 'Email already used. Please sign in or use a different email.';
        break;
      case 'user-not-found':
        _response = 'User with this email does not exist';
        break;
      case 'wrong-password':
        _response = 'Incorrect password. Please try again.';
        break;
      default:
        _response = 'Cannot Authenticate for unknown error';
        break;
    }
  } else if (_error is DioError) {
    switch (_error.type) {
      case DioErrorType.cancel:
        _response = 'Request to server was Cancelled';
        break;
      case DioErrorType.connectTimeout:
        _response = 'Connection Timed Out';
        break;
      case DioErrorType.other:
        _response =
        'Connection Failed due to internet';
        break;
      case DioErrorType.receiveTimeout:
        _response = 'Receive Time out while communication with server';
        break;
      case DioErrorType.response:
        _response =
        'Invalid Status Code: ${_error.response?.statusCode}';
        break;
      case DioErrorType.sendTimeout:
        _response = 'Request Timed Out while sending to server';
        break;
      default:
        _response = 'Cannot process the request due to unknown error';
        break;
    }
  } else if ( _error.toString() == '-1' || _error.toString() == '-2'  ){
    _response = 'Could not fetch user for unknown reasons';
  } else  {
    _response = 'Unknown Error Occurred';
  }
  return _response;

}