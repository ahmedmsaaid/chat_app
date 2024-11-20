import 'package:chat_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'consntanse.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Talker',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
