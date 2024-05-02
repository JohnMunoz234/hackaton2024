import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:hackaton_2024_mv/feature/auth/login/presentation/form_validate/email_input.dart';
import 'package:hackaton_2024_mv/feature/auth/login/presentation/form_validate/password_input.dart';

final getApiProvider = FutureProvider<int>((ref) async {
  return Future.value(1);
});

final loginStateProvider =
    StateNotifierProvider.autoDispose<LoginScreenNotifier, LoginState>((ref) {
  return LoginScreenNotifier();
});

class LoginScreenNotifier extends StateNotifier<LoginState> {
  LoginScreenNotifier() : super(LoginState());

  void onEmailChanged(String value) {
    state = state.copyWith(
      email: EmailInput.dirty(value),
    );
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(
      password: PasswordInput.dirty(value),
    );
  }

  void login({
    required Function onSuccess,
    required Function onFailed,
  }) {
    _touchEveryField();
    if (!state.isFormValid) {
      return;
    }

    const userName = 'cartarus28@gmail.com';
    const password = 'Car99022807524!';

    if (state.email.value == userName && state.password.value == password) {
      onSuccess.call();
    } else {
      onFailed.call();
    }
  }

  void _touchEveryField() {
    final email = EmailInput.dirty(state.email.value);
    final password = PasswordInput.dirty(state.password.value);

    state = state.copyWith(
      email: email,
      password: password,
      isFormValid: Formz.validate(
        [state.email, state.password],
      ),
    );
  }
}

class LoginState {
  final EmailInput email;
  final PasswordInput password;
  final bool isFormValid;

  LoginState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isFormValid = false,
  });

  LoginState copyWith({
    EmailInput? email,
    PasswordInput? password,
    bool? isFormValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
