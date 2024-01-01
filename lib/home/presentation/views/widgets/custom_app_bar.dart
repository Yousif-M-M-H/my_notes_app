import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/utils/app_router.dart';
import 'package:notes_app/home/presentation/views/widgets/custom_icon_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Notes",
          style: TextStyle(fontSize: 43, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kNotesSearchView);
                },
                child: const CustomIconContainerAppBar(icon: Icons.search)),
            const SizedBox(
              width: 20,
            ),
            const CustomIconContainerAppBar(icon: Icons.info_outline_rounded)
          ],
        )
      ],
    );
  }
}
