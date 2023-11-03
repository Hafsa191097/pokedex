import 'package:Pokedex/Views/Sources/login_form.dart';
import 'package:Pokedex/Views/Sources/signup_form.dart';
import 'package:Pokedex/Views/splash.dart';
import 'package:Pokedex/Views/home/app.dart';
import 'package:Pokedex/cubit/auth_bloc/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'Blocs/details_bloc/details_bloc.dart';
import 'Blocs/pokemon_bloc/pokemon_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  AuthenticationCubit authenticationCubit = AuthenticationCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
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
              child:const LoginForm(),
            ),
        '/home': (context) => MultiBlocProvider(
              providers: [
                 
                BlocProvider(
                  create: (context) => AuthenticationCubit(),
                  
                ),
                BlocProvider.value(
                  value: authenticationCubit,
                ),
                BlocProvider(
                  create: (context) => PokemonBloc()),
                BlocProvider(
                create: (context) => DetailsBloc()),
                
              ],
              child: const App(),
            )
      },
    );
  }
}