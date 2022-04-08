import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';

class TitleBar extends StatefulWidget {
  final String title;
  final String button;
<<<<<<< HEAD
  const TitleBar({Key? key, required this.title, required this.button})
      : super(key: key);
=======
  const TitleBar({Key? key, required this.title, required this.button}) : super(key: key);
>>>>>>> 4094ad5194996cf72e94ba5e9a40da1941ec4ddf

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
      child: Row(
        children: [
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.title,
            style: textStyleSouTitle,
          ),
          Spacer(),
          Text(
            widget.button,
            style: textStyleSmall.copyWith(color: mainColor),
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }
}
