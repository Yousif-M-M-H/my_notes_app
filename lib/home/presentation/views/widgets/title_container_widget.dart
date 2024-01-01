import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/styles.dart';

class TitleContainerWidget extends StatelessWidget {
  const TitleContainerWidget(
      {Key? key,
      required this.containerColor,
      required this.title,
      required this.onTap})
      : super(key: key);
  final Color containerColor;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.textStyle25,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
