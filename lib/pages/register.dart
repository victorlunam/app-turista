import 'package:appturista/pages/register_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterDataPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    './assets/icons/email.svg',
                    width: 28,
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
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFC1C1C1),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    './assets/icons/google.svg',
                    height: 28,
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
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    './assets/icons/facebook.svg',
                    height: 28,
                  ),
                  const Expanded(
                    child: Text(
                      'Continuar con Facebook',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1B54CF),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
