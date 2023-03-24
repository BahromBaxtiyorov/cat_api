import 'package:cat_api/view/mainView.dart';
import 'package:cat_api/view/photo_page.dart';
import 'package:cat_api/view/upload_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
      routes: {
        '/UploadPage':(context)=> const UploadPage(),
        '/PhotoPage':(context)=> const PhotoPage(),
      },
    );
  }
}

