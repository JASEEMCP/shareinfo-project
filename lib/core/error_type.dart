// ignore_for_file: constant_identifier_names

enum ApiErrorType {
  SUCCESS,
  NO_CONTENT,
  RESET_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class RespCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int RESET_CONTENT = 205; // success with no data (RESET content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTHORIZED = 401; // failure, user is not authorized
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ErrorMessage {
  static const String NO_CONTENT = 'No available data';
  static const String INTERNAL_SERVER_ERROR =
      'Something went wrong, try again later';
  static const String NO_INTERNET_CONNECTION =
      'Please check your internet connection';

  ///local message
  static const String FIELD_NOT_EMPTY = 'TextField could not be empty';
  static const String INVALID_EMAIL = 'Enter valid email address';
  static const String INVALID_PHONE_NUMBER = 'Enter valid phone number';
  static const String INVALID_PASSWORD =
      'Enter password with special character';
}
