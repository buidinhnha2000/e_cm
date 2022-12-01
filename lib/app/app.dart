import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/auth/authentication_repository/authentication/bloc/authentication_bloc.dart';
import 'package:e_cm/auth/authentication_repository/authentication_repository.dart';
import 'package:e_cm/auth/authentication_repository/user_repository/user_repository.dart';
import 'package:e_cm/domain/repository/movie_repository.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<MovieRepository>(
          create: (context) => MovieRepository()),
      RepositoryProvider.value(
          value: authenticationRepository,
          child: BlocProvider(
            create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository,
                userRepository: userRepository),
          )),
    ], child: AppMain());
  }
}

class AppMain extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: AppRouter.onGeneratedRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.screen,
      navigatorKey: _navigatorKey,
    );
  }
}
