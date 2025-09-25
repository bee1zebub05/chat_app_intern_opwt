import 'package:auto_route/auto_route.dart';
import 'package:chat_app/generated/colors.gen.dart';
import 'package:chat_app/src/common/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Container(color: ColorName.greenFile,));
  }
}