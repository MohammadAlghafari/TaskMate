import 'package:shared_preferences/shared_preferences.dart';

import '../singletons/singletons.dart';

// Base Provider to provide the local storage object

class BaseLocalStorageProvider {
  SharedPreferences sharedPrefrences = getIt<SharedPreferences>();
}
