import 'package:flutter/cupertino.dart';

import 'package:timed_tasks/shared/widget/app_bar_icon_button.widget.dart';
import 'package:timed_tasks/shared/widget/bottom_sheet.widget.dart';

class CreateTaskList extends StatefulWidget {
  CreateTaskList({Key? key}) : super(key: key);

  @override
  State<CreateTaskList> createState() => _CreateTaskListState();
}

class _CreateTaskListState extends State<CreateTaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppBarIconButton(
                icon: Icon(CupertinoIcons.clear),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Text(
                    'Neue Liste',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  CupertinoTextField(
                    placeholder: 'Name',
                  ),
                  SizedBox(height: 16),
                  CupertinoTextField(
                    placeholder: 'Beschreibung',
                  ),
                  SizedBox(height: 16),
                  CupertinoButton.filled(
                    child: Text('Erstellen'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
