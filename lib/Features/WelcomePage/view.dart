import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Core/app_colors/app_colors.dart';
import '../../Core/route_utils/route_utils.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../SignUp/view.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 182.h,
            ),
            Image.asset(
              'Assets/Images/puzzel.png',
              height: 260.h,
              width: 260.w,
            ),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: AppColors.primaryG,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ).createShader(bounds),
              child: const AppText(
                title: "Welcome to the app",
                fontFamily: "Roboto",
                fontSize: 24,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 56.h,
            ),
            AppButton(
              width: 217.w,
              height: 50.86.h,
              title: "Sign up",
              onPressed: () {
                RouteUtils.push(
                  const SignUpView(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: AppText(
                title: "Click on sign up !",
              ),
            ),
          );
        },
        child: Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.primaryG,
            ),
            borderRadius: BorderRadius.circular(27.5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(
                  0,
                  2,
                ),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.near_me,
            size: 24,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
