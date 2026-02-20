import 'package:flutter/material.dart';
import 'home.dart';

class StartupWizard extends StatelessWidget {
  const StartupWizard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Are you new to E-MIR?",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF06543B),
                ),
                textAlign: TextAlign.center,
              ),
              Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to the tutorial page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF06543B),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                      ),
                      child: const Text(
                        "YES, take me around.",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                      ),
                      child: const Text(
                        "NO, I know how to navigate E-MIR.",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
