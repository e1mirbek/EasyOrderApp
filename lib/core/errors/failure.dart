class Failure {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});

  @override
  String toString() => message;
}

// Специальный класс для ошибок сервера/Firebase

class AuthFailure extends Failure {
  const AuthFailure(super.message, {super.code});
}
