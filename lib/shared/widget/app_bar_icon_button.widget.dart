import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton(
      {Key? key, required this.icon, required this.onPressed, this.hint = ""})
      : super(key: key);

  final Icon icon;
  final VoidCallback onPressed;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: icon,
            onPressed: onPressed,
            padding: EdgeInsets.zero,
          )
        : IconButton(
            icon: icon,
            tooltip: hint,
            onPressed: onPressed,
          );
  }
}
