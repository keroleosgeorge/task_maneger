import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_str.dart';
import '../../../utils/constants.dart';
import '../widget/task_widget.dart';


class BuildHomeBody extends StatefulWidget {
  const BuildHomeBody({
    super.key,
    required this.textTheme,
    required this.tasksTest,
  });

  final TextTheme textTheme;
  final List<String> tasksTest;

  @override
  State<BuildHomeBody> createState() => _BuildHomeBodyState();
}

class _BuildHomeBodyState extends State<BuildHomeBody> {
  String _selectedFilter = 'All Tasks';

  void _filterTasks(String filter) {
    setState(() {
      _selectedFilter = filter;
      // ? Logic to filter tasks can be added here
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          // * Custom App Bar
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(
                      AppColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    const Text(
                      AppStr.mainTitle,
                      style: TextStyle(
                          fontSize: 50,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      AppStr.mainSubtitle,
                      style: widget.textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // * Divider
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),
          // * Filter Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _filterTasks('All Tasks'),
                child: Text(
                  'All ',
                  style: TextStyle(
                    color: _selectedFilter == 'All Tasks'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: _selectedFilter == 'All Tasks'
                      ? AppColors.primaryColor
                      : Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () => _filterTasks('Completed Tasks'),
                child: Text(
                  'Completed ',
                  style: TextStyle(
                    color: _selectedFilter == 'Completed Tasks'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: _selectedFilter == 'Completed Tasks'
                      ? AppColors.primaryColor
                      : Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () => _filterTasks('Pending Tasks'),
                child: Text(
                  'Pending ',
                  style: TextStyle(
                    color: _selectedFilter == 'Pending Tasks'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: _selectedFilter == 'Pending Tasks'
                      ? AppColors.primaryColor
                      : Colors.white,
                ),
              ),
            ],
          ),
          // * Todo List
          Expanded(
            child: widget.tasksTest.isNotEmpty
                ? ListView.builder(
                    itemCount: widget.tasksTest.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          // ? logic DeleteSql
                          
                        },
                        background: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete_outline, color: Colors.grey),
                            Text(
                              AppStr.deleteTask,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        key: Key(index.toString()),
                        child: TaskWidget(),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // * Lottie Animation
                      FadeIn(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Lottie.asset(
                            lottieUrl,
                            animate: true,
                          ),
                        ),
                      ),
                      // * Text
                      FadeInUp(
                        child: const Text(
                          AppStr.doneAllTask,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
