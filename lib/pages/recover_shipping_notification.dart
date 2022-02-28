import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecoverShippingNotificationPage extends StatefulWidget {
  const RecoverShippingNotificationPage({Key? key}) : super(key: key);

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('./assets/icons/backbutton.svg'),
        ),
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
                    child: const Text(
                      'Ingresar código',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF1B8F26),
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
