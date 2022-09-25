import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return this.showBottomSheet(context, this.children);
  }

  showBottomSheet(BuildContext context, List<Widget> pChildren) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        ListView.builder(
          itemCount: pChildren.length,
          itemBuilder: (context, index) {
            return pChildren[index];
          },
        );
        throw UnimplementedError();
      },
    );
  }
}
