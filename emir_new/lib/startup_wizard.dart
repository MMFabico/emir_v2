import 'package:flutter/material.dart';

class StartupWizard extends StatelessWidget {
  const StartupWizard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Are you new to E-MIR?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text("YES, take me around."),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text("NO, I know how to navigate E-MIR."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
