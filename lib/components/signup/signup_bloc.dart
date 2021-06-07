import 'dart:async';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:clean_onboarding/data/onboarding_calls/onboarding_endpoints.dart';
import 'package:clean_onboarding/models/user_logged.dart';

import '../auth/authentication_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

abstract class SignUpPageContract {
  void onSignUpSuccess(UserLogged userLogged);
  void onLoginError(String errorTxt);
}

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({@required this.authenticationBloc,}) : assert(authenticationBloc != null);

  @override
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      OnBoardingRestDataSource api = new OnBoardingRestDataSource();
      yield SignUpLoading();
      try {
        api.signup(event.name, event.surname,
            event.email, event.password,
            event.phone)
            .then((UserLogged userLogged) {
          authenticationBloc.add(LoggedIn(token: userLogged.userToken));
        }).catchError((Object error) => print(error.toString()));
        yield SignUpInitial();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
