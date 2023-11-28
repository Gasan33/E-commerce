import 'package:flutter/material.dart';
import 'package:shopping/app_router.dart';

void main() {
  runApp(ShoppingApp(
    appRouter: AppRouter(),
  ));
}

class ShoppingApp extends StatelessWidget {
  final AppRouter appRouter;
  const ShoppingApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
