import 'package:appturista/presentation/widgets/appbar_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:appturista/presentation/widgets/custom_textfield.dart';

class SignUpDataPage extends StatefulWidget {
  const SignUpDataPage({Key? key}) : super(key: key);

  @override
  State<SignUpDataPage> createState() => _SignUpDataPageState();
}

class _SignUpDataPageState extends State<SignUpDataPage> {
  final namesController = TextEditingController();
  final lastNamesController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hola Viajero, llena tus\ndatos para iniciar',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                controller: namesController,
                label: 'Nombre',
              ),
              CustomTextField(
                controller: lastNamesController,
                label: 'Apellidos',
              ),
              CustomTextField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                label: 'Correo electrónico',
              ),
              CustomTextField(
                controller: passwordController,
                label: 'Contraseña',
                type: 'password',
              ),
              CustomTextField(
                controller: repeatPasswordController,
                label: 'Repita Contraseña',
                type: 'password',
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/register/preferences'),
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
