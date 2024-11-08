import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Regístrate gratis',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/register/data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffC1C1C1),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/email.svg',
                    height: globalSizeIcon,
                  ),
                  const Expanded(
                    child: Text(
                      'Continuar con mi correo electrónico',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/google.svg',
                    height: globalSizeIcon,
                  ),
                  const Expanded(
                    child: Text(
                      'Continuar con Google',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B54CF),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/facebook.svg',
                    height: globalSizeIcon,
                  ),
                  const Expanded(
                    child: Text(
                      'Continuar con Facebook',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
