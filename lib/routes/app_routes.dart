import 'package:get/get.dart';
import 'package:ryanlord/features/auth/login_view/view/activition_code_view.dart';
import 'package:ryanlord/features/auth/login_view/view/create_account.dart';
import 'package:ryanlord/features/auth/login_view/view/register_view.dart';
import 'package:ryanlord/features/auth/splash_view/view/splash_view.dart';
import 'package:ryanlord/features/customer_bottom_navigation_bar/view/customer_bottom_navigation_view.dart';
import 'package:ryanlord/features/permissions_view/view/allow_essentials_view.dart';
import 'package:ryanlord/features/call_view/view/incoming_call_view.dart';
import 'package:ryanlord/features/call_view/view/ongoing_call_view.dart';
import 'package:ryanlord/features/tab_views/profile_view/view/edit_profile_view.dart';
class AppRoute {

  static const String splashView = '/splashView';
  static const String allowEssentialsView = '/allowEssentialsView';
  static const String registerView = '/registerView';
  static const String activisionCodeView = '/activisionCodeView';
  static const String createAccount = '/createAccount';
  static const String customerBottomNavigationView = '/customerBottomNavigationView';
  static const String incomingCallView = '/incomingCallView';
  static const String ongoingCallView = '/ongoingCallView';
  static const String editProfileView = '/editProfileView';



  static String getSplashView() => splashView;
  static String getAllowEssentialsView() => allowEssentialsView;
  static String getRegisterView() => registerView;
  static String getActivisionCodeView() => activisionCodeView;
  static String getCreateAccount() => createAccount;
  static String getCustomerBottomNavigationView() => customerBottomNavigationView;
  static String getIncomingCallView() => incomingCallView;
  static String getOngoingCallView() => ongoingCallView;
  static String getEditProfileView() => editProfileView;



  static List<GetPage> routes = [
    GetPage(name: splashView, page: () => SplashView()),
    GetPage(name: allowEssentialsView, page: () => AllowEssentialsView()),
    GetPage(name: registerView, page: () => RegisterView()),
    GetPage(name: activisionCodeView, page: () => ActivitionCodeView()),
    GetPage(name: createAccount, page: () => CreateAccount()),
    GetPage(name: customerBottomNavigationView, page: () => CustomerBottomNavigationView()),
    GetPage(name: incomingCallView, page: () => IncomingCallView()),
    GetPage(name: ongoingCallView, page: () => OngoingCallView()),
    GetPage(name: editProfileView, page: () => EditProfileView()),
  ];
}
