import '../../extension/string_extension.dart';

class AppImages {
  AppImages._init();
  static AppImages? _instace;
  static AppImages get instance => _instace ??= AppImages._init();

  //String approvalsIcon = 'onaylarim'.toPNG;
}
