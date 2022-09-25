import 'package:flutter/cupertino.dart';

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
      child: Padding(
        padding: EdgeInsets.all(8),
        child: child,
      ),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
