import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/pages/pages.dart';
import 'package:flutter_social_app/generate_route.dart';
import 'package:flutter_social_app/futures/presentation/bloc/simple_bloc_observer.dart';
import 'locator_service.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runZonedGuarded<void>(
    () {
      Bloc.observer = SimpleBlocObserver();
      runApp(const MyApp());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final osThemeIsLight =
      WidgetsBinding.instance.window.platformBrightness == Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>()..add(const AuthEvent.appStarted()),
        ),
        BlocProvider<CredentialBloc>(
          create: (_) => di.sl<CredentialBloc>(),
        ),
        BlocProvider<UserBloc>(
          create: (_) =>
              di.sl<UserBloc>()..add(const UserEvent.getUsersEvent()),
        ),
        BlocProvider<GroupBloc>(
          create: (_) =>
              di.sl<GroupBloc>()..add(const GroupEvent.getGroupsEvent()),
        ),
        BlocProvider<ChatBloc>(
          create: (_) => di.sl<ChatBloc>(),
        ),
        BlocProvider<MyGroupBloc>(
          create: (_) => di.sl<MyGroupBloc>(),
        ),
        // * If Android/IOS theme of the device is light, start app with light theme,
        // * else start app with dark theme
        osThemeIsLight
            ? BlocProvider(
                create: (context) =>
                    ThemeCubit(initialTheme: AppThemes.lightTheme))
            : BlocProvider(
                create: (context) =>
                    ThemeCubit(initialTheme: AppThemes.darkTheme)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) => MaterialApp(
          theme: state,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: OnGenerateRoute.route,
          routes: {
            "/": (context) {
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, authState) {
                  return authState.when(
                    initial: () => Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )),
                    loading: () => Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )),
                    auth: (uid) => HomePage(uid: uid),
                    unAuth: () => const LoginPage(),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
