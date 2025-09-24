import 'package:chat_app/generated/colors.gen.dart';
import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget customDivider({double thick = 0.5, Color color = ColorName.grayBackground}) {
  return Divider(
    color: ColorName.grayBackground,
    thickness: thick.w,
    indent: UIConst.defaultPadding / 2,
    endIndent: UIConst.defaultPadding / 2,
  );
}
