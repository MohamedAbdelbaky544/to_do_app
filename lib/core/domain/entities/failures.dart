abstract class Failure {}

class LocalFailure implements Failure {
  final String? message;
  LocalFailure({this.message});
}

class NetworkFailure implements Failure {
  final String? message;
  NetworkFailure({this.message});
}
