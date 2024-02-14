import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_task/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:flutter_demo_task/routes/app_routes.dart';

import 'bloc/message_data_bloc/message_data_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          MessageDataBloc()
            ..add(const FetchMessageApiData()),
        ),

        BlocProvider(
          create: (context) => DialogBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}