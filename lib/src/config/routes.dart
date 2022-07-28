import 'package:flutter/material.dart';

import '../presentation/views/home/home_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> applicationRoutes = {
    HomePage.route: (BuildContext context) => const HomePage(),
  };
}
