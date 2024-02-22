import 'package:authapp/routes/route_names.dart';
import 'package:authapp/screens/change_password/change_password_page.dart';
import 'package:authapp/screens/login/login_page.dart';
import 'package:authapp/screens/signup/sign_up_page.dart';
import 'package:go_router/go_router.dart';

GoRouter appRoutes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/signup',
      name: RouteNames.signup,
      builder: (context, state) {
        return const SignUpPage();
      },
    ),
    GoRoute(
      path: '/login',
      name: RouteNames.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/changePassword',
      name: RouteNames.changePassword,
      builder: (context, state) {
        return const ChangePasswordPage();
      },
    ),
  ],
);
