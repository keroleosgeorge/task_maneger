import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';


class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              // * Delete task action
            },
            icon: const Icon(Icons.delete_outline_rounded),
            label: const Text('Cancel Task'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              backgroundColor: Colors.grey[200],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // * Add task action
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Add Task',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              backgroundColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
