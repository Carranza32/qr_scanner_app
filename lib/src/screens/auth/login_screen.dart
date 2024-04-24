import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Monket!'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade800,
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.network(
              'https://www.migracion.gob.sv/wp-content/uploads/2020/11/pnc-3.png',
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                children: [
                  Text(
                    "Better homes, smarter, for your finance.",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFeatures: [const FontFeature.enable('smcp')],
                    ),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size( MediaQuery.of(context).size.width * 1, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text("Let's Go!"),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}