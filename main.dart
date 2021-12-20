import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/views/views/home_view.dart';
import 'package:todo_app/TodoDetailView.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'My tasks',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home:const HomeView());
//   }
// }import 'package:device_preview/device_preview.dart';

import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
