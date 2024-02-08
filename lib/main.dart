import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samrental/assets/theme.dart';
import 'package:samrental/core/routes/app_routes.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:samrental/features/home/presentation/bloc/notifications/notification_bloc.dart';
import 'package:samrental/firebase_options.dart';

import 'core/data/injector_container.dart';
import 'generated/codegen_loader.g.dart';
import 'generated/locale_keys.g.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );

  /// Commands for running easy localization and generating code
  /// flutter pub run easy_localization:generate -o codegen_loader.g.dart -S lib/assets/strings
  /// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S lib/assets/strings
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('ru'), Locale('en'), Locale('uz')],
    path: 'lib/assets/strings',
    fallbackLocale: const Locale('ru'),
    assetLoader: const CodegenLoader(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(create: (context) => NotificationBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: LocaleKeys.sam_rental.tr(),
        theme: AppTheme.darkTheme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
