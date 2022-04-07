import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Maclat, a new food expernience',
              style: textStyleTitle,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration:
                  BoxDecoration(borderRadius: radius, color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'continu with your phone number',
                    style: textStyleSimple,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefix: Text("+213"),
                        border: null,
                        errorBorder: null,
                        enabledBorder: null,
                        focusedBorder: null,
                        disabledBorder: null),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
