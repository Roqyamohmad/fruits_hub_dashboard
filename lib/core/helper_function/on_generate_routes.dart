import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashbord/views/dashboard_views.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardViews.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardViews());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
