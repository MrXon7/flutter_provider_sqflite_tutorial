import 'package:flutter/material.dart';
import 'package:project1/lesson3/data/repository/mind_repository.dart';
import 'package:project1/lesson3/ui/write_database.dart';
import 'package:project1/lesson3/view_model/mind_view_model.dart';
import 'package:project1/provider_lesson/provider/counter_view.dart';
import 'package:project1/provider_lesson2/view_model/product_view_model.dart';
import 'package:project1/service/local_db_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CounterViewModel()),
      ChangeNotifierProvider(create: (context) => ProductViewModel()),
      ChangeNotifierProvider(
          create: (context) =>
              MindViewModel(mindRepository: MindRepository(db: LocalDb())))
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WriteDbPage(),
    );
  }
}
