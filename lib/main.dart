import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/features/settings/index.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SL.setupServiceLocator();
  await SharedPrefHelper.init();
  await dotenv.load(fileName: ".env");
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => SettingsBloc(),
      child: const MainApp(),
    ),
  );
}
