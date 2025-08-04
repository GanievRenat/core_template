import 'package:core_template/common/di/init_di.dart';
import 'package:core_template/common/domain/app_config.dart';
import 'package:core_template/common/service/app_state_service.dart';
import 'package:core_template/featuries/auth/pages/auth_page.dart';
import 'package:core_template/featuries/home/pages/home_page.dart';
import 'package:core_template/featuries/onboarding/pages/onboarding_page.dart';
import 'package:core_template/featuries/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'transition.dart';

part 'routers/auth_routers/auth_router.dart';
part 'routers/main_routers/home_router.dart';
part 'routers/main_routers/main_router.dart';
part 'app_router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    try {
      if (getIt<AppStateService>().isAuth) {
        return const HomeRoute().location;
      } else {
        return const AuthRoute().location;
      }
    } catch (e) {
      return const AuthRoute().location;
    }
  }
}
