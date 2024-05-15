import 'package:go_router/go_router.dart';
import 'package:tres_b_tech/presentation/views/views.dart';

part 'app_routes.dart';

class AppPages {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.cart,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
