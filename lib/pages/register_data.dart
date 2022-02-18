import 'package:appturista/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterDataPage extends StatefulWidget {
  const RegisterDataPage({Key? key}) : super(key: key);

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState();
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  final namesController = TextEditingController();
  final lastNamesController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('./assets/icons/backbutton.svg'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Hola Viajero, llena tus\ndatos para iniciar',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            CustomTextField(
              controller: namesController,
              label: 'Nombre',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: lastNamesController,
              label: 'Apellidos',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              label: 'Correo electrónico',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: passwordController,
              label: 'Contraseña',
              type: 'password',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: repeatPasswordController,
              label: 'Repita Contraseña',
              type: 'password',
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Iniciar',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF1B8F26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
