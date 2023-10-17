import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final Widget? leading;
  final AppBar appBar;
  final List<Widget> widgets;

  const BaseAppBar({
    super.key,
    required this.title,
    required this.appBar,
    required this.widgets,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      forceMaterialTransparency: true,
      centerTitle: true,
      leading: leading,
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
