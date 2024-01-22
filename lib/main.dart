import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/bloc/home_bloc.dart';
import 'package:notes_app/core/colors.dart';
import 'package:notes_app/domain/di/injectable.dart';
import 'package:notes_app/domain/home/model/notes_model.dart';
import 'package:notes_app/presentations/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // configure injectable
  await configureInjectable();
  // initialize hive
  await Hive.initFlutter();
  // check adapter registered, if not register it
  if (!Hive.isAdapterRegistered(NotesModelAdapter().typeId)) {
    Hive.registerAdapter(NotesModelAdapter());
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<HomeBloc>();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // hide debug banner
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: primaryBGColor,
            titleTextStyle: const TextStyle(
              color: primaryOverlay,
              fontSize: 20,
            ),
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: primaryOverlay,
          ),
        ),
        home: const HomeScreen(),      
      ),
    );
  }
}