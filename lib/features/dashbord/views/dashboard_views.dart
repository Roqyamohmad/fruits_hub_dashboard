import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashbord/views/widgets/dashboard_view_body.dart';

class DashboardViews extends StatelessWidget {
  const DashboardViews({super.key});
  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardViewBody(),
    );
  }
}
