import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/bloc%20food/food_bloc.dart';
import 'package:mbh/UI/Screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

FoodBloc foodBloc = FoodBloc(prixtotal: 200);

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => foodBloc,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Container(
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
          ),
          body: Stack(alignment: Alignment.bottomCenter, children: [
            Positioned(
                child: Image.asset(
              'phonenumberback.png',
              filterQuality: FilterQuality.high,
            )),
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
                        decoration: BoxDecoration(
                            borderRadius: radius, color: greyColor),
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
                                    child: Icon(
                                      FontAwesomeIcons.phone,
                                      color: inColor,
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
      ),
    );
  }
}
