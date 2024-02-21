import 'package:authapp/screens/signup/sign_up_page.dart';
import 'package:go_router/go_router.dart';

GoRouter appRoutes = GoRouter(
  initialLocation: '/signup',
  routes: [
    GoRoute(
      path: '/signup',
      builder: (context, state) {
        return const SignUpPage();
      },
    ),
  ],
);
