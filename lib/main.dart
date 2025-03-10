import 'package:flutter/material.dart';
import 'package:latihan_quiz/pages/login_page.dart';
import 'package:latihan_quiz/pages/home_page.dart';
import 'package:latihan_quiz/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi CV',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Poppins',
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.indigo),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.indigo, width: 2),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(username: '', namaPanggilan: ''),
        '/profile': (context) => const ProfilePage(
              namaLengkap: "",
              nim: "",
              pengalamanKerja: "",
              pengalamanOrganisasi: "",
              hardSkill: "",
              softSkill: "",
              pencapaian: "",
            ),
      },
    );
  }
}