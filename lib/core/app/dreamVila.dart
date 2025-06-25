

import 'package:dreamvila/core/utils/ImagePickerUtils.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/viewmodels/auth_bloc/auth_bloc.dart';
import 'package:dreamvila/viewmodels/language_bloc/language_bloc.dart';
import 'package:dreamvila/viewmodels/language_bloc/language_event.dart';
import 'package:dreamvila/viewmodels/language_bloc/language_state.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../utils/navigator_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageBloc()..add(LoadLanguageEvent())),
        BlocProvider(create: (_) => SplashBloc()..add(LoadSplashEvent())),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => PropertyDetailBloc()),
        BlocProvider(create: (_) => AddProductBloc())
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            builder: (_, child) {
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: MyAppThemeHelper.lightTheme,
                themeMode: ThemeMode.light,
                routes: AppRoutes.routes,
                initialRoute: AppRoutes.initialRoute,
                locale: state.locale,
                navigatorKey: NavigatorService.navigatorKey,
                localizationsDelegates: const [
                  Lang.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              );
            },
          );
        },
      ),
    );
  }
}
