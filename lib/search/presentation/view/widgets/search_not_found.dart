import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchNoFound extends StatelessWidget {
  const SearchNoFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/file_search.svg',
          width: 370,
          height: 240,
        ),
        const Text(
          "Note not found. Try searching again.",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
