import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToHomeView(context);
    super.initState();
  }

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
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Take your notes easily",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

void navigateToHomeView(context) {
  Future.delayed(
    const Duration(seconds: 3),
    () {
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
    },
  );
}
