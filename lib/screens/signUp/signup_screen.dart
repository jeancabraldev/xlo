import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xlo/components/raisedButton/raised_button.dart';
import 'package:xlo/components/textFormField/text_form_field.dart';
import 'package:xlo/screens/signUp/components/field_title.dart';

// ignore: use_key_in_widget_constructors
class SignUpScreen extends StatelessWidget {
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitleWidget(
                      title: 'Apelido',
                      subTitle: 'Esse apelido aparecerá nos anúncios',
                    ),
                    TextFormFieldWidget(
                      icon: FontAwesomeIcons.userAlt,
                      textInputType: TextInputType.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'E-mail',
                        subTitle: 'Informe seu melhor e-mail',
                      ),
                    ),
                    TextFormFieldWidget(
                      icon: FontAwesomeIcons.solidEnvelope,
                      textInputType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'Celular',
                        subTitle: 'Proteja sua conta',
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey[700]),
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        prefixIcon: Icon(FontAwesomeIcons.phoneAlt),
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'Senha',
                        subTitle: 'Use letras, números e caracteres especiais',
                      ),
                    ),
                    TextFormFieldWidget(
                      icon: FontAwesomeIcons.lock,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FieldTitleWidget(
                        title: 'Repita a Senha',
                        subTitle: 'Confirme a senha digitada',
                      ),
                    ),
                    TextFormFieldWidget(
                      icon: FontAwesomeIcons.lock,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    RaisedButtonWidget(
                      onPressed: () {},
                      colorButton: Colors.deepOrangeAccent,
                      textButton: 'ENTRAR',
                      textColorButton: Colors.white,
                    ),
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
