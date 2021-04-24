import 'package:consulta_marcada/ui/bloc/address_bloc.dart';
import 'package:consulta_marcada/ui/bloc/patient_bloc.dart';
import 'package:consulta_marcada/ui/pages/splash_page.dart';
import 'package:consulta_marcada/ui/styles/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PatientBloc()),
        ChangeNotifierProvider(create: (context) => AddressBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'consulta marcada',
        theme: lightTheme,
        home: SplashPage(),
      ),
    );
  }
}
