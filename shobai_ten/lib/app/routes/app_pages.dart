import 'package:get/get.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/HomePage2.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => NavigasiPage(0),
      binding: HomeBinding(),
    ),
  ];
}
