import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/utils/app_router.dart';
import 'package:notes_app/home/presentation/view_models/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/home/presentation/view_models/list_notes_cubit/list_notes_cubit.dart';
import 'package:notes_app/search/presentation/cubit/search_notes_cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListNotesCubit(),
        ),
        BlocProvider(
          create: (context) => AddNotesCubit(),
        ),
        BlocProvider(
          create: (context) => SearchNotesCubitCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
