import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class DataPostFailure extends Failure {
  final String message;
  final String statusCode;

  DataPostFailure({this.message = 'Error! \n Try again', this.statusCode = ''});

  @override
  List<Object?> get props => [message, statusCode];
}
