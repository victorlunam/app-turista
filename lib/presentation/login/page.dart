import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_turista/presentation/widgets/custom_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                label: 'Correo electrónico',
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: passwordController,
                label: 'Contraseña',
                type: 'password',
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (Route<dynamic> route) => false,
                    arguments: 0,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B8F26),
                  ),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'o Ingresar con',
                style: TextStyle(
                  color: Color(0xff939393),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/facebook_color.svg',
                      height: globalSizeIcon,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/google.svg',
                      height: globalSizeIcon,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/recover'),
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Color(0xFF212121),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
