import 'package:app_mensajeria/presentation/screens/login_screen.dart';
import 'package:app_mensajeria/presentation/widgets/button_widget.dart';
import 'package:app_mensajeria/presentation/widgets/textfield_password_widget.dart';
import 'package:app_mensajeria/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class MySignUpScreen extends StatelessWidget {
  MySignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.055),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Crea una cuenta',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF272727)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Solo tomara unos minutos',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA3A3A3)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MyTextFieldWidget(
                text: 'Correo Electrónico',
                width: 420,
                controllerTextField: _emailController),
            const SizedBox(
              height: 15,
            ),
            MyPasswordTextFieldWidget(
                text: 'Contraseña',
                width: 420,
                controllerTextField: _passwordController),
            const SizedBox(
              height: 15,
            ),
            MyPasswordTextFieldWidget(
                text: 'Confirmar Contraseña',
                width: 420,
                controllerTextField: _confirmPasswordController),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyLoginScreen()));
                },
                textButton: 'Entrar',
                width: 420,
                height: 40,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1C2541),
                colorText: const Color(0xFFFFFFFF)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿Ya tienes cuenta?,',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF797979)),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyLoginScreen()));
                    },
                    child: const Text(
                      'inicia sesión aquí.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C2541)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
