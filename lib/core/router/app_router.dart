import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/portfolio/presentation/pages/main_page.dart';
import '../../features/portfolio/presentation/pages/stock_list_page.dart';
import '../../shared/services/storage_service.dart';

enum AppRoute { login, signup, main, stockList }

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) async {
      final isLoggedIn = await StorageService.isLoggedIn();
      final isLoginPage = state.fullPath == '/login';
      final isSignupPage = state.fullPath == '/signup';

      // 로그인되어 있고 로그인/회원가입 페이지에 있다면 메인으로 리다이렉트
      if (isLoggedIn && (isLoginPage || isSignupPage)) {
        return '/main';
      }

      // 로그인되어 있지 않고 보호된 페이지에 있다면 로그인으로 리다이렉트
      if (!isLoggedIn && !isLoginPage && !isSignupPage) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: AppRoute.signup.name,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/main',
        name: AppRoute.main.name,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/stocks',
        name: AppRoute.stockList.name,
        builder: (context, state) => const StockListPage(),
      ),
    ],
  );
});
