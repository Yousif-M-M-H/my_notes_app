import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyNotesWidget extends StatelessWidget {
  const EmptyNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          'assets/images/Notebook-rafiki.svg',
          width: 400,
          height: 400,
        ),
        const Text(
          "You dont have any notes please add one",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 19),
        )
      ],
    );
  }
}
