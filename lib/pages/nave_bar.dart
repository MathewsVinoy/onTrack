import 'package:flutter/material.dart';
import 'package:ontrack/functions/colors.dart';
import 'package:ontrack/pages/addpage.dart';
import 'package:ontrack/pages/homepage.dart';
import 'package:ontrack/pages/tasks_list_page.dart';

class NaveBarComp extends StatefulWidget {
  const NaveBarComp({super.key});

  @override
  State<NaveBarComp> createState() => _NaveBarCompState();
}

class _NaveBarCompState extends State<NaveBarComp> {
  int index = 0;
  final screen = [const HomePage(), const TasksListPage(), const AddPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "onTrack",
          style: TextStyle(color: mainColor),
        ),
      ),
      body: screen[index], // Change here
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 255, 255, 255)),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: mainColor,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.list,
                color: mainColor,
              ),
              label: "Tasks",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.add,
                color: mainColor,
              ),
              label: "Add",
            ),
          ],
        ),
      ),
    );
  }
}
