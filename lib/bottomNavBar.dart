import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: counter,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: counter == 0 ? Colors.purple : Colors.black,
            ),
            title: Text("Home"),
            backgroundColor: Colors.grey[200]),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: counter == 1 ? Colors.purple : Colors.black,
            ),
            title: Text("Search"),
            backgroundColor: Colors.grey[200]),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: counter == 2 ? Colors.purple : Colors.black,
            ),
            title: Text("Camera"),
            backgroundColor: Colors.grey[200]),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: counter == 3 ? Colors.purple : Colors.black,
            ),
            title: Text("person"),
            backgroundColor: Colors.grey[200]),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: counter == 4 ? Colors.purple : Colors.black,
            ),
            title: Text("person"),
            backgroundColor: Colors.grey[200])
      ],
      onTap: (index) {
        setState(() {
          counter = index;
        });
      },
    );
  }
}
