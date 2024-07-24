import 'app_config.dart';

class BasePaths{

  const BasePaths._();

  static const baseImagePath = "assets/images";
  static const baseAnimationPath = "assets/animations";
  static const baseIconPath = "assets/icons";
  static const basePlaceholderPath = "assets/placeholders";
  static const baseProdUrl = "https://attendance.urbanco.id/api";
  static const baseTestUrl = "http://localhost/absensi/api";
  static const baseUrl = AppConfig.devMode ? baseTestUrl : baseProdUrl;
}