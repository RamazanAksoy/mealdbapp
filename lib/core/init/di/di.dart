import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/image/images.dart';
import '../cache/locale_manager.dart';
import '../network/network_manager.dart';

class DependencyInjection {
  static init() async {
    AppImages.instance;
    await Future.wait([
      LocaleManager.prefrencesInit(),
      Hive.initFlutter(),
    ]);
    NetworkManager.instance!.coreDio;
  }
}
