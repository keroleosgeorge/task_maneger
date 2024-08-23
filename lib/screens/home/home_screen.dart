import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../utils/app_colors.dart';
import 'components/custom_drawer.dart';
import 'components/fab.dart';
import 'components/home_body.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tasksTest = [
    'Task 1',
    'Task 2',
    'Task 3',
    'Task 1',
    'Task 2',
    'Task 3',
  ];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: const Fab(),
      body: SliderDrawer(
        // * Slider App Bar
        appBar: SliderAppBar(
          title: const Text(''),
          drawerIconColor: Colors.black,
          trailing: IconButton(
            iconSize: 30,
            icon: const Icon(
              Icons.delete_forever_outlined,
              color: Colors.black,
            ),
            onPressed: () async {
              final result = await PanaraConfirmDialog.show(
                context,
                title: "Delete Confirmation",
                message: "Are you sure you want to delete all tasks?",
                confirmButtonText: "Yes",
                cancelButtonText: "No",
                onTapCancel: () {
                  Navigator.of(context)
                      .pop(false); // ! Return false if canceled
                },
                onTapConfirm: () {
                  Navigator.of(context).pop(true); // ? Return true if confirmed
                },
                panaraDialogType: PanaraDialogType.custom,
                color: AppColors.primaryColor,
              );

              if (result == true) {
                // ? Perform delete operation
              }
            },
          ),
        ),
        // * Slider Drawer
        slider: CustomDrawer(),
        // * Main Body
        child: BuildHomeBody(
          textTheme: textTheme,
          tasksTest: tasksTest,
        ),
      ),
    );
  }
}
