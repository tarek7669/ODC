part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupDroplist extends SignupState {}
class SignupSuccess extends SignupState {}
class SignupError extends SignupState {}
