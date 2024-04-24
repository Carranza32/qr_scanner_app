import 'package:get/get.dart';
import '../../screens/index.dart';

class Routes {
	static final route = [
    GetPage(
      name: '/product-list',
      page: () => ProductListScreen(),
    ),
		GetPage(
			name: '/product-detail',
			page: () => ProductDetailScreen(),
		),
    GetPage(
      name: '/product-form',
      page: () => ProductFormScreen(),
    ),
		GetPage(
			name: '/login',
			page: () => const LoginScreen(),
		),
    GetPage(
      name: '/onboarding',
      page: () => const Onboarding(),
    ),
    GetPage(
			name: '/tabs',
			page: () => const TabScreen(),
		),
	];
}