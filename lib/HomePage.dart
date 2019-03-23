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
          body: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: buildGridElement,
            itemCount: list.length,
          )),
    );
  }

  var list = ['Karthik', 'Saya', 'Aniket', 'Manan', 'Janavi', 'Devansh'];

  Widget buildGridElement(BuildContext context, int position) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
              child: Image(
                image: AssetImage('images/cm.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(list[position],style: TextStyle(fontSize: 18),),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
