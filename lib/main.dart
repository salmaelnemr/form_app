import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_app/Features/WelcomePage/view.dart';
import 'Core/route_utils/route_utils.dart';
import 'Core/utils.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: RouteUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child){
        ScreenUtil.init(
          context,
          designSize: const Size(414, 896),
        );
        return child!;
      },
      theme: Utils.appTheme,
      home: const WelcomePageView(),
    );
  }
}
