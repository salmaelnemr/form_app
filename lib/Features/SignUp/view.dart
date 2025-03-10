import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_app/Features/WelcomePage/view.dart';
import '../../Core/app_colors/app_colors.dart';
import '../../Core/route_utils/route_utils.dart';
import '../../Core/validator_utils/validator_utils.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/app_text_field.dart';
import '../../Widgets/secondary_app_bar.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String? gender;
  bool isAgreed = false;
  bool isDarkMode = false;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  void submitForm() {
    if (formKey.currentState!.validate() && isAgreed) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const AppText(
              title: "User Data",
              color: AppColors.blue,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  title: "First Name: ${firstNameController.text}",
                  color: AppColors.black,
                ),
                AppText(
                  title: "Last Name: ${lastNameController.text}",
                  color: AppColors.black,
                ),
                AppText(
                  title: "Gender: ${gender ?? 'Not selected'}",
                  color: AppColors.black,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const AppText(
                  title: "Ok",
                  color: AppColors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      appBar: SecondaryAppBar(
        title: "Sign Up",
        onTap: () {
          RouteUtils.push(const WelcomePageView());
        },
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppText(
                  title: "Create account",
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                  color: AppColors.black,
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  hint: 'First Name',
                  prefixIcon: 'Assets/Images/personIcon.png',
                  controller: firstNameController,
                  validator: ValidatorUtils.name,
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  hint: 'Last Name',
                  prefixIcon: 'Assets/Images/personIcon.png',
                  controller: lastNameController,
                  validator: ValidatorUtils.name,
                ),
                SizedBox(height: 16.h),
                Container(
                  width: 317.w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                    //border: Border.all(color: AppColors.greyLight,),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        title: "Gender:",
                        color: AppColors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                      RadioListTile<String>(
                        title: const AppText(
                          title: "Male",
                          color: AppColors.black,
                        ),
                        activeColor: AppColors.blue,
                        value: "Male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const AppText(
                          title: "Female",
                          color: AppColors.black,
                        ),
                        activeColor: AppColors.blue,
                        value: "Female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  width: 317.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: SwitchListTile(
                    title: const AppText(
                      title: "Dark Mode",
                      color: AppColors.black,
                    ),
                    value: isDarkMode,
                    activeColor: AppColors.blue,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 344.w,
                  child: CheckboxListTile(
                    title: const AppText(
                      title: "Agree to terms and conditions",
                      color: AppColors.black,
                    ),
                    activeColor: AppColors.blue,
                    value: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                AppButton(
                  width: 217.w,
                  height: 50.86.h,
                  title: "Submit",
                  onPressed: submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
