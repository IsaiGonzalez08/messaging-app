import 'package:app_mensajeria/presentation/widgets/button_widget.dart';
import 'package:app_mensajeria/presentation/widgets/textfield_password_widget.dart';
import 'package:app_mensajeria/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class MyLoginScreen extends StatelessWidget {
  MyLoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  '¡Hola de Nuevo!',
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
                    'Inicia sesión con tú cuenta',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA3A3A3)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextFieldWidget(
                text: 'Correo Electronico',
                width: 420,
                controllerTextField: _emailController),
            const SizedBox(
              height: 10,
            ),
            MyPasswordTextFieldWidget(
                text: 'Contraseña',
                width: 420,
                controllerTextField: _passwordController),
            const SizedBox(
              height: 30,
            ),
            const ButtonWidget(
                textButton: 'Entrar',
                width: 420,
                height: 40,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C2541),
                colorText: Color(0xFFFFFFFF)),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿No tienes cuenta aún?',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF797979)),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      'Regístrate aquí',
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
