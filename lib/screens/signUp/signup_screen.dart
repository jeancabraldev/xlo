import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xlo/components/iconButton/icon_button.dart';
import 'package:xlo/components/raisedButton/raised_button.dart';
import 'package:xlo/components/textFormField/text_form_field.dart';
import 'package:xlo/screens/signUp/components/field_title.dart';
import 'package:xlo/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitleWidget(
                      title: 'Apelido',
                      subTitle: 'Esse apelido aparecerá nos anúncios',
                    ),
                    Observer(builder: (_) {
                      return TextFormFieldWidget(
                        iconPre: FontAwesomeIcons.userAlt,
                        textInputType: TextInputType.text,
                        onChanged: signupStore.setName,
                        errorText: signupStore.nameError,
                        enabled: !signupStore.loading,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'E-mail',
                        subTitle: 'Informe seu melhor e-mail',
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextFormFieldWidget(
                        iconPre: FontAwesomeIcons.solidEnvelope,
                        textInputType: TextInputType.emailAddress,
                        onChanged: signupStore.setEmail,
                        errorText: signupStore.emailError,
                        enabled: !signupStore.loading,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'Celular',
                        subTitle: 'Proteja sua conta',
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextFormField(
                        style: TextStyle(color: Colors.grey[700]),
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.phoneError,
                          prefixIcon: const Icon(FontAwesomeIcons.phoneAlt),
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        onChanged: signupStore.setPhone,
                        enabled: !signupStore.loading,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'Senha',
                        subTitle: 'Use letras, números e caracteres especiais',
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextFormFieldWidget(
                        iconPre: FontAwesomeIcons.lock,
                        iconSuf: IconButtonWidget(
                          radius: 32,
                          icon: signupStore.passwordVisible
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          onTap: signupStore.togglePasswordVisibility,
                        ),
                        textInputType: TextInputType.visiblePassword,
                        obscureText: !signupStore.passwordVisible,
                        onChanged: signupStore.setPassword,
                        errorText: signupStore.passwordError,
                        enabled: !signupStore.loading,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'Repita a Senha',
                        subTitle: 'Confirme a senha digitada',
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextFormFieldWidget(
                        iconPre: FontAwesomeIcons.lock,
                        iconSuf: IconButtonWidget(
                          radius: 32,
                          icon: signupStore.confirmPasswordVisible
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          onTap: signupStore.toggleConfirmPasswordVisibility,
                        ),
                        textInputType: TextInputType.visiblePassword,
                        obscureText: !signupStore.confirmPasswordVisible,
                        onChanged: signupStore.setConfirmPassword,
                        errorText: signupStore.confirmPasswordError,
                        enabled: !signupStore.loading,
                      );
                    }),
                    Observer(builder: (_) {
                      return RaisedButtonWidget(
                        colorButton: Colors.deepOrangeAccent,
                        textButton: signupStore.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                'ENTRAR',
                                style: TextStyle(color: Colors.white),
                              ),
                        textColorButton: Colors.white,
                        disabledColor: Colors.deepOrangeAccent.withAlpha(110),
                        onPressed: signupStore.signUpPressed,
                      );
                    }),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Já tem uma conta? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.deepPurpleAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
