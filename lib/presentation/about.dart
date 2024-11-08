import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                    ),
                    const Text(
                      'Dromomania! App',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const Text('para dispositivos Android'),
                    const SizedBox(height: globalSpacing * 2),
                    const Text(
                      'v. 1.0.1',
                      style: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: globalSpacing * 2),
                    const Text(
                      'Copyright © 2022 Dromomania Company S.A.S',
                      style: TextStyle(
                        color: Color(0xFF707070),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0, color: Color(0xFFE4E1E1)),
              const ListTile(
                title: Text('Política de privacidad'),
                tileColor: Color(0xFFF8F8F8),
                minVerticalPadding: globalSpacing * 3,
                trailing: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: globalSpacing / 2,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 40,
                  ),
                ),
              ),
              const Divider(height: 0, color: Color(0xFFE4E1E1)),
              const ListTile(
                title: Text('Términos y condiciones'),
                tileColor: Color(0xFFF8F8F8),
                minVerticalPadding: globalSpacing * 3,
                trailing: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: globalSpacing / 2,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 40,
                  ),
                ),
              ),
              const Divider(height: 0, color: Color(0xFFE4E1E1)),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B8F26),
                  ),
                  child: const Text(
                    'Califícanos en Play Store',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: globalSpacing * 2),
            ],
          ),
        ),
      ),
    );
  }
}
