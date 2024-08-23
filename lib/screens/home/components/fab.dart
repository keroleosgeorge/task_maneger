import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../task_view.dart';


class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const TaskView()));
      },
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
          child: Icon(
        Icons.add,
        color: Colors.white,
      )),
    );
  }
}
