import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/theme_constants.dart';
import 'package:rick_and_morty/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/service_locator.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/service_locator.dart';
import 'package:rick_and_morty/core/providers/theme_provider.dart';

import 'feature/presentation/pages/person_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = true;

  void toggleTheme(bool value) {
    setState(() {
      isDarkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isDarkTheme: isDarkTheme,
      toggleTheme: toggleTheme,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PersonSearchBloc>(
            create: (context) => sl<PersonSearchBloc>(),
          ),
          BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()..loadPerson(),
          ),
        ],
        child: MaterialApp(
          theme: isDarkTheme
              ? ThemeConstants.darkTheme
              : ThemeConstants.lightTheme,
          home: const PersonScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
