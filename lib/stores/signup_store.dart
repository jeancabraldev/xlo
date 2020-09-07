import 'package:mobx/mobx.dart';
import 'package:xlo/helpers/extensions.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {

  //name
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;

  String get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'O apelido tem que ter mais de 6 caracteres';
    }
  }

  //email
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  //phone
  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;

  String get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  //password
  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length > 6;

  String get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'A senha deve ser maior que 6 caracteres';
    }
  }

  //confirm password
  @observable
  String confirmPassword;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get confirmPasswordValid =>
      confirmPassword != null && confirmPassword == password;

  String get confirmPasswordError {
    if (confirmPassword == null || confirmPasswordValid) {
      return null;
    } else {
      return 'As senhas não são iguais';
    }
  }

  //visible password
  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  //visible confirm password
  @observable
  bool confirmPasswordVisible = false;

  @action
  void toggleConfirmPasswordVisibility() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  //Validando todos os campos do formulário
  @computed
  bool get isFormValid =>
      nameValid &&
      emailValid &&
      phoneValid &&
      passwordValid &&
      confirmPasswordValid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  //Carregando informações
  @observable
  bool loading = false;

  @action
  Future<void> _signUp() async {
    loading = true;

    await Future.delayed(Duration(seconds: 5));

    loading = false;
  }
}
