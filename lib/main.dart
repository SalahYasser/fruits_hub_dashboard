import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/utils/app_api_keys.dart';
import 'features/dashboard/views/dashboard_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseKey);

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const FruitsHubDashboard());
}

class FruitsHubDashboard extends StatelessWidget {
  const FruitsHubDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,
    );
  }
}
