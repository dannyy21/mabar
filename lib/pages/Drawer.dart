import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawwerScreenState createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("FahriFar"),
          currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/fahri.jpg')),
          accountEmail: Text("GoldPlayer"),
        ),
        DrawerListTile(
          iconData: Icons.group,
          title: "My Profile",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.lock,
          title: "History",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.notifications,
          title: "Player",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.contacts,
          title: "Team",
          onTilePressed: () {},
        )
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile(
      {Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
