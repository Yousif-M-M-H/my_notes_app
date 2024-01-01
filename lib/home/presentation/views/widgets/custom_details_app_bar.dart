import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/home/presentation/views/widgets/custom_icon_container.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key, this.onSavePressed});

  final void Function()? onSavePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child:
              const CustomIconContainerAppBar(icon: Icons.arrow_back_ios_new),
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFF3B3B3B),
                  borderRadius: BorderRadius.circular(16)),
              child: IconButton(
                icon: const Icon(Icons.save),
                onPressed: onSavePressed,
              ),
            ),
            const SizedBox(width: 15),
            const CustomIconContainerAppBar(icon: Icons.remove_red_eye_sharp),
          ],
        )
      ],
    );
  }
}
