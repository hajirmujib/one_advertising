import 'package:flutter/material.dart';

class AppbarApp extends StatelessWidget implements PreferredSizeWidget {
  const AppbarApp(
      {Key? key,
      this.title,
      this.appBar,
      this.widgets,
      this.leading = true,
      this.centerTitle = false})
      : super(key: key);

  final String? title;
  final AppBar? appBar;
  final List<Widget>? widgets;
  final bool? leading;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: centerTitle,
        automaticallyImplyLeading: leading!,
        title: Text(
          title.toString(),
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppin Semi Bold"),
        ),
        actions: widgets);
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar!.preferredSize.height);
}
