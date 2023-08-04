import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_flutter/src/provider/Stateprovider.dart';
import 'package:qr_scan_flutter/src/screens/HomeScreen.dart';
import 'package:qr_scan_flutter/src/screens/MapScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            'map': (_) => const MapScreen()
          },
          theme: ThemeData.dark()),
    );
  }
}
