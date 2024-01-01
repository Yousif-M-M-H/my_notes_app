import 'package:go_router/go_router.dart';
import 'package:notes_app/home/presentation/views/home_view.dart';
import 'package:notes_app/home/presentation/views/notes_details_view.dart';
import 'package:notes_app/search/search_view.dart';
import 'package:notes_app/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kNotesDetailsView = '/notesDetailsView';
  static const kNotesSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kNotesDetailsView,
        builder: (context, state) => const NotesDetailsView(),
      ),
      GoRoute(
        path: kNotesSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
