import 'package:get/get.dart';
import 'package:ryanlord/features/auth/login_view/view/activition_code_view.dart';
import 'package:ryanlord/features/auth/login_view/view/create_account.dart';
import 'package:ryanlord/features/auth/login_view/view/register_view.dart';
import 'package:ryanlord/features/auth/splash_view/view/splash_view.dart';
import 'package:ryanlord/features/permissions_view/view/allow_essentials_view.dart';
import 'package:ryanlord/features/permissions_view/view/notification_permission_view.dart';
class AppRoute {

  static const String splashView = '/splashView';
  static const String allowEssentialsView = '/allowEssentialsView';
  static const String notificationPermissionView = '/notificationPermissionView';
  static const String registerView = '/registerView';
  static const String activisionCodeView = '/activisionCodeView';
  static const String createAccount = '/createAccount';




  static String getSplashView() => splashView;
  static String getAllowEssentialsView() => allowEssentialsView;
  static String getNotificationPermissionView() => notificationPermissionView;
  static String getRegisterView() => registerView;
  static String getActivisionCodeView() => activisionCodeView;
  static String getCreateAccount() => createAccount;




  static List<GetPage> routes = [
    GetPage(name: splashView, page: () => SplashView()),
    GetPage(name: allowEssentialsView, page: () => AllowEssentialsView()),
    GetPage(name: notificationPermissionView, page: () => NotificationPermissionView()),
    GetPage(name: registerView, page: () => RegisterView()),
    GetPage(name: activisionCodeView, page: () => ActivitionCodeView()),
    GetPage(name: createAccount, page: () => CreateAccount()),
  ];
}
