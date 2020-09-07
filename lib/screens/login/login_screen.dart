import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xlo/components/raisedButton/raised_button.dart';
import 'package:xlo/components/textFormField/text_form_field.dart';
import 'package:xlo/screens/signUp/signup_screen.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Acessar com E-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 12),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    TextFormFieldWidget(
                      icon: FontAwesomeIcons.solidEnvelope,
                      textInputType: TextInputType.emailAddress,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Senha',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          GestureDetector(
                            child: const Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                //fontWeight: FontWeight.w600,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                        ],
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
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Não tem uma conta? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SignUpScreen(),
                              ),
                            ),
                            child: const Text(
                              'Cadastre-se',
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