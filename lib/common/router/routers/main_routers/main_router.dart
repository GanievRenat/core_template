part of '../../app_router.dart';

@TypedShellRoute<MainRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: HomeRoute.path),
    TypedGoRoute<OnboardingRoute>(path: OnboardingRoute.path),
    TypedGoRoute<SettingsRoute>(path: SettingsRoute.path),
  ],
)
class MainRoute extends ShellRouteData {
  const MainRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      navigator;
}
