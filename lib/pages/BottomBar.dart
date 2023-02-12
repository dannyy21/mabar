import 'package:flutter/material.dart';
import 'package:tugas/pages/ChatScreen.dart';
import 'package:tugas/pages/DiscoverScreen.dart';
import 'package:tugas/pages/HomeScreen.dart';
import 'package:tugas/pages/MyProfileScreen.dart';
import 'package:tugas/pages/ProfileScreen.dart';
import 'package:tugas/pages/SearchPlayer.dart';
import 'package:tugas/pages/TeamScreen.dart';

// class BottomBar extends StatefulWidget {
//   // final String value;
//   // HomePage({
//   //   Key? key,
//   //   required String this.value,
//   // }) : super(key: key);
//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int _selectedIndex = 0;
//   final List<Widget> _children = [HomeScreen(), DiscoverScreen()];

//   void onTappedBar(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     // HomePage(),
//     Text(
//       'Index 1: Statistics',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Discover',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 3: Discover',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 4: Discover',
//       style: optionStyle,
//     ),
//     // Text(
//     //   'Index 3: Account',
//     //   style: optionStyle,
//     // ),
//   ];
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('BottomNavigationBar Sample'),
//       // ),
//       body: _children[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         // onTap : onTappedBar,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Statistics',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Discover',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_outlined),
//             label: 'Chat',
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.account_circle_outlined),
//           //   label: 'Profile',
//           // ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.purple.shade400,
//         onTap: onTappedBar,
//       ),
//     );
//   }
// }
class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    SearchPlayer(),
    TeamScreen(),
    ChatScreen(),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              Container(),
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      // body: Container(),
    );
  }
}
