import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    /*return Container(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Spacer(),
              Image.asset('assets/Group18.png'),
              Text(
                "Goals",
                style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
              ),
              Spacer(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Spacer(),
              Image.asset('assets/Group 449.png'),
              Text(
                "Goals",
                style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
              ),
              Spacer(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset('assets/Group 448.png'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Spacer(),
              Image.asset('assets/money-bag 1.png'),
              Text(
                "Goals",
                style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
              ),
              Spacer(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Spacer(),
              Image.asset('assets/Group 369.png'),
              Text(
                "Goals",
                style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );*/

    return Container(
      height: 80,
      child: Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: BottomNavigationBar(
          currentIndex: counter,

          showUnselectedLabels: true,
          //type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/Group18.png'),
                title: Text(
                  "Goals",
                  style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
                ),
                backgroundColor: Colors.grey[200]),
            BottomNavigationBarItem(
                icon: Image.asset('assets/Group 449.png'),
                title: Text(
                  "Spend",
                  style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
                ),
                backgroundColor: Colors.grey[200]),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Group 448.png',
                  height: 66,
                  width: 66,
                ),
                title: Container(height: 0.0),
                backgroundColor: Colors.grey[200]),
            BottomNavigationBarItem(
                icon: Image.asset('assets/money-bag 1.png'),
                title: Text(
                  "Borrow",
                  style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
                ),
                backgroundColor: Colors.grey[200]),
            BottomNavigationBarItem(
                icon: Image.asset('assets/Group 369.png'),
                title: Text(
                  "Circles",
                  style: TextStyle(color: Color(0xffA4AABF), fontSize: 10),
                ),
                backgroundColor: Colors.grey[200])
          ],
          onTap: (index) {
            setState(() {
              counter = index;
            });
          },
        ),
      ),
    );
  }
}
