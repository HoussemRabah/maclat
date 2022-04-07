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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: mainColor,
          ),
          padding: EdgeInsets.all(16.0),
          child: Text(
            "étape suivante",
            style: textStyleSouTitle.copyWith(color: inColor),
          ),
        ),
        body: Stack(children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset('phonenumberback.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Bienvenue à Maclat',
                  style: textStyleTitle,
                ),
              ),
              Text(
                'une expérience culinaire unique',
                style: textStyleSouTitle,
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                padding: EdgeInsets.all(32.0),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration:
                    BoxDecoration(borderRadius: radius, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Utilisez votre numéro de téléphone pour accéder aux services de maclat',
                      style: textStyleSimple,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration:
                          BoxDecoration(borderRadius: radius, color: greyColor),
                      child: Center(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: textStyleSimple,
                          cursorColor: mainColor,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "0X XX XX XX XX",
                              icon: Container(
                                  padding: EdgeInsets.all(18.0),
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30))),
                                  child: Text(
                                    "+213",
                                    style: textStyleSimple.copyWith(
                                        color: inColor),
                                  )),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ]),
      ),
    );
  }
}
