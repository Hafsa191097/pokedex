import 'package:Pokedex/Views/Sources/login_form.dart';
import 'package:Pokedex/Views/Sources/signup_form.dart';
import 'package:Pokedex/Views/home/Likes.dart';
import 'package:Pokedex/Views/splash.dart';
import 'package:Pokedex/cubit/auth_bloc/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'Views/home/home.dart';
import 'firebase_options.dart';
import 'Blocs/pokemon_bloc/pokemon_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.openBox('favorites');
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  AuthenticationCubit authenticationCubit = AuthenticationCubit();
  // PokedexBloc bloc = PokedexBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signup': (context) => BlocProvider.value(
              value: authenticationCubit,
              child: SignupForm(),
            ),
        '/login': (context) => BlocProvider.value(
              value: authenticationCubit,
              child: const LoginForm(),
            ),
        '/likes': (context) => BlocProvider(
              create: (context) => PokemonBloc(),
              child:const LikesPage(),
            ),
        '/home': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PokemonBloc(),
                ),
                BlocProvider.value(
                  value: authenticationCubit,
                ),
              ],
              child: const HomePage(),
            ),
      },
    );
  }
}
