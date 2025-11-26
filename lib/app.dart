import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/bindings/controller_binder.dart';
import 'package:ryanlord/core/utils/theme/theme.dart';
import 'package:ryanlord/routes/app_routes.dart';

class RyanLord extends StatelessWidget {
  const RyanLord({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // base design size (like iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'RyanLord',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.splashView,
          getPages: AppRoute.routes,
          initialBinding: ControllerBinder(),
          home: child,
          themeMode: ThemeMode.system, 
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        );
      },
      // child: const HomeView()
    );
  }
}
