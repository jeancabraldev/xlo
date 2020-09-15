import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo/helpers/extensions.dart';
import 'package:xlo/repositories/user_repository.dart';
import 'package:xlo/stores/user_manager_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String get emailError =>
      email == null || emailValid ? null : 'E-mail inválido';

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 4;

  String get passwordError =>
      password == null || passwordValid ? null : 'Senha Inválida';

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @computed
  Function get loginPressed => (isFormValid && !loading) ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;
    try {
      final user = await UserRepository().loginWithEmail(email, password);
      //Salvando dados do usuário
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
