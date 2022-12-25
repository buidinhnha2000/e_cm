import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/domain/repository/movie_repository.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/pages/page/login/auth/auth_bloc.dart';
import 'package:e_cm/pages/page/login/user/user_bloc.dart';
import 'package:e_cm/pages/page/product_detail/bloc/product_bloc.dart';
import 'package:e_cm/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieRepository>(
            create: (context) => MovieRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductBloc()),
          // BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => AuthBloc())
        ],
        child: AppMain(),
      ),
    );
  }
}

class AppMain extends StatelessWidget {
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
      initialRoute: AppRoutes.login,
    );
  }
}
