import 'package:flutter/material.dart';

class TAppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const TAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Appbar'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
