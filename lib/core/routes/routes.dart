import 'package:go_router/go_router.dart';
import 'package:instagram/data/view/details/details.dart';
import 'package:instagram/data/view/profile/profile.dart';
import '../../data/view/home/home.dart';

final route = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const Home()),
    GoRoute(
        path: "/profile", builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: "/details",
        builder: (context, state) {
          final data = state.extra as Details;
          return Details(user: data.user, post: data.post);
        }),
  ],
);
