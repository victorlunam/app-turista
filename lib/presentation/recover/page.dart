import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:app_turista/presentation/widgets/custom_textfield.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            children: [
              const SizedBox(height: 10),
              const Text(
                'Recuperar contraseña',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                'Ingresa el correo con el que create tu cuenta\npara enviar un código de recuperación',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                label: 'Correo electrónico',
              ),
              Expanded(
                  child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                        context, '/recover/shippingNotification'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B8F26),
                    ),
                    child: const Text(
                      'Enviar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
