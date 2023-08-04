import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_flutter/src/provider/Stateproviders.dart';
import 'package:qr_scan_flutter/src/screens/HomeScreen.dart';
import 'package:qr_scan_flutter/src/screens/MapScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR scan',
          initialRoute: 'home',
          routes: {
            'home': (_) => const HomeScreen(),
            'map': (_) => MapScreen()
          },
          theme: ThemeData.dark()),
    );
  }
}
