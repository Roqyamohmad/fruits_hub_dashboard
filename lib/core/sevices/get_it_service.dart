import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
}
