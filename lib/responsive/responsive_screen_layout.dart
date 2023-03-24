import 'package:flutter/material.dart';
import 'package:insta_clone/providers/user_providers.dart';
import 'package:provider/provider.dart';
import '../utils/global_variables.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {required this.mobileScreenLayout, required this.webScreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = await Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth > webScreenSize) {
          // it will display a web screen if the screen size exceeds 600 pixel
          return widget.webScreenLayout;
        } else {
          //else it will display the mobile screen
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}
