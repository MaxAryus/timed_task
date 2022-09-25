import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerCard extends StatelessWidget {
  ContainerCard({
    required this.child,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  final Widget child;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
        child: child,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
