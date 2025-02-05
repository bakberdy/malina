import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:malina/core/blocs/cart_bloc/cart_bloc_bloc.dart';
import 'package:malina/core/blocs/qr_bloc/qr_bloc.dart';
import 'package:malina/core/route/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QrBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp.router(
        builder: BotToastInit(),
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
