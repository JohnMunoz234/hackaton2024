import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../navigation/router.dart';

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: RouterNav().router,
      builder: (context, child) {
        child = MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: ScreenUtilInit(
            designSize: const Size(360, 803),
            minTextAdapt: true,
            useInheritedMediaQuery: true,
            builder: (ctx, ch) {
              return ch!;
            },
            child: child,
          ),
        );
        return child;
      },
    );
  }
}
