part of '../../app_router.dart';

class HomeRoute extends GoRouteData {
  const HomeRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      shellNavigatorKey;

  static const path = '/home';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return Transition.fade(
      pageKey: state.pageKey,
      child: HomePage(
        onSettings: () => const SettingsRoute().push(context),
        onSingOut: () {},
      ),
    );
  }
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      shellNavigatorKey;

  static const path = '/settings';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return Transition.fade(pageKey: state.pageKey, child: SettingsPage());
  }
}

class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      shellNavigatorKey;

  static const path = '/onboarding';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return Transition.fade(
      pageKey: state.pageKey,
      child: OnboardingPage(onHome: () => const HomeRoute().go(context)),
    );
  }
}
