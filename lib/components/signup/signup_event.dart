part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpButtonPressed extends SignUpEvent {
  final String name;
  final String surname;
  final String email;
  final String password;
  final String phone;

  const SignUpButtonPressed({
    @required this.name,
    @required this.surname,
    @required this.email,
    @required this.password,
    @required this.phone,
  });

  @override
  List<Object> get props => [name, surname, email, password, phone];

  @override
  String toString() =>
      'SignUpButtonPressed { name: $name, surname: $surname'
          ', email: $email, password: $password, phone: $phone }';
}
