import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_function/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/features/dashbord/views/dashboard_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: DashboardViews.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
