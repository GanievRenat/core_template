import 'dart:async';

import 'package:core_template/common/di/init_di.dart';
import 'package:core_template/common/service/analytics/events.dart';
import 'package:core_template/common/service/services.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../domain/app_builder.dart';
import '../domain/app_runner.dart';
import '../state/global_main_bloc_state.dart';

class MainAppRunner implements AppRunner {
  final String env;

  MainAppRunner({required this.env});

  @override
  Future<void> preloadData() async {
    // init app
    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp();

    // init di
    await initDi(env);
    // init config

    getIt<CrashlyticsService>().init();
    await getIt<AnalyticsService>().init();

    //await getIt<AuthRepository>().init();

    if (getIt<AppStateService>().isAuth) {
      /*getIt<BalanceCubit>().init();
      getIt<HistoryCubit>().init();
      getIt<SubscriptionStateCubit>().init();
      getIt<SelectModeCubit>().init();
      getIt<LibraryCardsCubit>().init();
      getIt<SettingsCubit>().init();*/

      if (getIt<AppStateService>().currentUser?.uid != null) {
        final userId = getIt<AppStateService>().currentUser!.uid;
        // Можно добавить дополнительные свойства, если нужно
        getIt<CrashlyticsService>().setUserId(userId, properties: null);
      }
    }

    unawaited(getIt<AnalyticsService>().logEvent(OnStartApp()));
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    final router = getIt<GoRouter>();
    final languageService = getIt<LanguageService>();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
      _,
    ) {
      runApp(
        EasyLocalization(
          supportedLocales: languageService.getSupportedLocales(),
          path: 'assets/translations',
          fallbackLocale: languageService.getDefaultLocale(),
          startLocale: languageService.loadLocale(),
          child: GlobalMainBlocState(child: appBuilder.buildApp(router)),
        ),
      );
    });
  }
}
