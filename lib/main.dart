import 'package:currency_converter_app/blocs/currency/currency_bloc.dart';
import 'package:currency_converter_app/common/di/di.dart';
import 'package:currency_converter_app/common/route/route.dart';
import 'package:currency_converter_app/repositories/currency_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'blocs/local_currency/local_currency_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  AppRouter get appRouter => getIt<AppRouter>();

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrencyBloc(currencyRepository: getIt<CurrencyRepo>()),
        ),
        BlocProvider(
          create: (context) => LocalCurrencyCubit(getIt<CurrencyRepo>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Currency Converter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: AutoRouterDelegate(appRouter),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
