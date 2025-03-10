import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Core/app_colors/app_colors.dart';
import 'app_text.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppBar({
    super.key,
    required this.title,
    this.actions,
    this.enableBackButton = false,
    this.onTap,
  });

  final String title;
  final List<Widget>? actions;
  final bool enableBackButton;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blueLight,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blue,
            ),
          ),
          SizedBox(width: 7.62.w),
          AppText(
            title: title,
            fontSize: 24,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
