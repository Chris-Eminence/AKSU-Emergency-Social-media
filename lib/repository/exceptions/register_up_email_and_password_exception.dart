class RegisterEmailAndPasswordFailure {
  final String message;

  const RegisterEmailAndPasswordFailure(
      [this.message = "An unknown Error occurred"]);

  factory RegisterEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const RegisterEmailAndPasswordFailure('Enter a stronger password');
      case 'invalid-email':
        return const RegisterEmailAndPasswordFailure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const RegisterEmailAndPasswordFailure('An account already exist for this email');
      case 'operation-not-allowed':
        return const RegisterEmailAndPasswordFailure('Operation is not allowed, contact support');
      case 'user-disabled':
        return const RegisterEmailAndPasswordFailure('This user has been disabled, contact support for help');
      default:
        return const RegisterEmailAndPasswordFailure();
    }
  }
}
