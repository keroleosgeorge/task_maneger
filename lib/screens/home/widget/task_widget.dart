import 'package:flutter/material.dart';


class TaskWidget extends StatelessWidget {
  TaskWidget({
    super.key,
    // required this.index,
  });
  // int index;
  List<Color> colors = [
    const Color(0xff253745),
    const Color(0xff4A5C6A),
    const Color(0xff9BA8AB),
  ];
  List<Color> chkColors = [
    const Color(0xff258745),
    const Color(0xff111245),
    const Color(0xff253745),
    const Color(0xff223745),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // * Add your onPressed code here !
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          // color: colors[index % colors.length], // ? task bg color
          color: const Color(0xff253745),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 300),
        child: ListTile(
          // * Check icon
          leading: GestureDetector(
            onTap: () {
              // * Add your onPressed code here!
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border(
                    top: BorderSide(width: 1.5),
                    bottom: BorderSide(width: 1.5),
                    left: BorderSide(width: 1.5),
                    right: BorderSide(width: 1.5),
                  )),
              child: const Icon(
                Icons.check,
                // color: chkColors[index % chkColors.length], // ? chk color
                color: Color(0xff258745),
              ),
            ),
          ),
          // * Task title
          title: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          // * Task description
          subtitle: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "This is a description",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        "11:20 AM",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
