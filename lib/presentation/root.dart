import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Dromomania\nTours',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    height: 0.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Regístrate gratis',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B8F26),
                ),
                child: const Text(
                  'Ya tengo una cuenta',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
