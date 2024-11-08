import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:flutter/material.dart';

class RecoverShippingNotificationPage extends StatefulWidget {
  const RecoverShippingNotificationPage({super.key});

  @override
  State<RecoverShippingNotificationPage> createState() =>
      _RecoverNotifySendtate();
}

class _RecoverNotifySendtate extends State<RecoverShippingNotificationPage> {
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
                'Hemos enviado un Código a tu correo\nque empieza en seb*****@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                  child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/recover/enterCode'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B8F26),
                    ),
                    child: const Text(
                      'Ingresar código',
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
