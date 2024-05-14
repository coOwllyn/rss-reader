import 'package:equatable/equatable.dart';
import 'package:err_rss_reader/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({
    required super.message,
    required super.statusCode,
  });

  APIFailure.fromException(APIException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class EmptyDBFailure extends Failure {
  const EmptyDBFailure() : super(message: "Database is empty", statusCode: 404);
}

class DBWriteFailure extends Failure {
  const DBWriteFailure()
      : super(message: "Error writing to local DB", statusCode: 500);
}
