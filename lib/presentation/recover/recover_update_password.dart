import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_turista/presentation/widgets/custom_textfield.dart';

class RecoverUpdatePasswordPage extends StatefulWidget {
  const RecoverUpdatePasswordPage({super.key});

  @override
  State<RecoverUpdatePasswordPage> createState() =>
      _RecoverUpdatePasswordPageState();
}

class _RecoverUpdatePasswordPageState extends State<RecoverUpdatePasswordPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  openAlertBox() => showDialog(
        context: context,
        barrierColor: const Color(0x66707070),
        barrierDismissible: false,
        builder: (BuildContext ctx) => AlertDialog(
          titlePadding: const EdgeInsets.symmetric(vertical: globalSpacing * 3),
          titleTextStyle: const TextStyle(
            color: Color(0xFF222423),
            fontSize: 18,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Contraseña Actualizada '),
              SvgPicture.asset(
                'assets/icons/check.svg',
                height: globalSizeIcon,
              )
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () => Navigator.popUntil(
                context,
                ModalRoute.withName('/login'),
              ),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1B8F26),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(globalBorderRadius * 2),
          ),
        ),
      );

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
                'Actualizar contraseña',
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
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: openAlertBox,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B8F26),
                      ),
                      child: const Text(
                        'Actualizar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
