import 'package:flutter/material.dart';

import '../features/bus_route.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationDrawerWidgetState();
  }
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Colors.lightBlue,
        child: ListView(
          padding: padding,
          children: <Widget>[

            const SizedBox(height: 50),
            buildMenuItem(
                text: 'Profile',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0)),
            Dividerwidget(),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 2)),
            Dividerwidget(),
            buildMenuItem(
                text: 'Settings',
                icon: Icons.settings_outlined,
                onClicked: () => selectedItem(context, 0)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String? text,
    IconData? icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black87;
    final hoverColor = Colors.white38;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text!, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => profilePage(),
       ));

        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Tracker(),
        ));
        break;
      case 2:
        Navigator.pushNamed(context, '/');
        break;
    }
  }
}


class Dividerwidget extends StatelessWidget {
  const Dividerwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: Colors.black,
      thickness: 1,
    );
  }
}
