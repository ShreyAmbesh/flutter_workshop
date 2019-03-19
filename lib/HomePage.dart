import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/cm.png'),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'NAME',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text('My Feed'),
                leading: Icon(Icons.list),
              ),
              ListTile(
                onTap: () {},
                title: Text('Help'),
                leading: Icon(Icons.help),
              ),
              ListTile(
                onTap: () {},
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
              ListTile(
                onTap: () {},
                title: Text('About'),
                leading: Icon(Icons.info),
              ),
              Spacer(),
              Container(
                color: Colors.grey,
                child: ListTile(
                  onTap: () {},
                  title: Text('Log Out'),
                  leading: Icon(Icons.vpn_key),
                ),
              ),
            ],
          ),
        ),
        body: GridView(
          physics: BouncingScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: <Widget>[Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),Text('asdsd'),],
        ),
      ),
    );
  }
}
