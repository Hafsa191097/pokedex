import 'package:Pokedex/Views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:const Size(360,690),
        builder: (context,index)
        => MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
            appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}