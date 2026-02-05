import 'package:emir_v2/reusable_widgets/logo_widget.dart';
import 'package:emir_v2/home.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // NOTE: not sure what MediaQuery is for, double check what it is
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.3, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/emir.png"),
                SizedBox(
                  height: 30,
                ),
                SignInButton(),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeRoute()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00543A),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text('Get Started', style: TextStyle(color: Colors.white),),
    );
  }
}