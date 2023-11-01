import 'package:Pokedex/Bloc/bloc/pokedex_bloc.dart';
import 'package:Pokedex/Views/Sources/login_form.dart';
import 'package:Pokedex/Views/Sources/signup_form.dart';
import 'package:Pokedex/Views/home/home.dart';
import 'package:Pokedex/Views/splash.dart';
import 'package:Pokedex/cubit/authentication/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

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
  PokedexBloc bloc =PokedexBloc();
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
                  create: (context) => PokedexBloc()..add(const PokedexPageRequest(pageindex: 0)),
                ),
                BlocProvider.value(
                  value: bloc,
                ),
              ],
              child:const HomeScreen(),
            )
      },
    );
  }
}
