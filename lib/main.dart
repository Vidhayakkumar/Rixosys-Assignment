import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rixosys/view_model/list_data_view_model.dart';
import 'package:rixosys/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> ListDataViewModel()),
        ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
