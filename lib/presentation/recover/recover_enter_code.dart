import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class RecoverEnterCode extends StatefulWidget {
  const RecoverEnterCode({super.key});

  @override
  State<RecoverEnterCode> createState() => _RecoverEnterCodeState();
}

class _RecoverEnterCodeState extends State<RecoverEnterCode> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _onEditing = true;
  String _code = '';

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
              const Text('Código Reenviado '),
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
                ModalRoute.withName('/recover/shippingNotification'),
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
                'Ingresar código',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                'Ingresa el código de 4 dígitos que hemos\nenviado a tu correo para modificar\ntu contraseña',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              VerificationCode(
                keyboardType: TextInputType.number,
                underlineColor: const Color(0xFF1B8F26),
                length: 4,
                cursorColor: const Color(0xFF1B8F26),
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, '/recover/updatePassword'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1B8F26),
                        ),
                        child: const Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: openAlertBox,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F1F1),
                          side: const BorderSide(
                            color: Color(0xFFC2C2C2),
                          ),
                        ),
                        child: const Text(
                          'Reenviar código al correo',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
