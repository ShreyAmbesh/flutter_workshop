import 'package:flutter/material.dart';
import 'package:flutter_workshop/GridItemModel.dart';
import 'package:flutter_workshop/ImageDisplay.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  var list = [GridItemModel('aniket','https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg'),
              GridItemModel('Karthik', 'https://pixel.nymag.com/imgs/daily/vulture/2017/11/01/01-thor-ragnarok.w700.h700.jpg'),
              GridItemModel('Saya', 'https://imgix.bustle.com/uploads/image/2018/4/18/58211582-1996-46b1-b108-41467cc7e6a3-screen-shot-2018-04-18-at-33656-pm.png'),
              GridItemModel('Manan', 'https://static.comicvine.com/uploads/original/11124/111240963/5274289-captainamerica_hero.png'),
              GridItemModel('Janavi', 'https://lumiere-a.akamaihd.net/v1/images/p_captainmarvel_characterposter_captainmarvel_ddt-17547_f5799718.jpeg?region=0,0,300,450'),
              GridItemModel('Devansh', 'https://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/10/18/Pictures/_5fb51944-d2ee-11e8-841e-211dfd3178e1.jpg')
  ];

  Widget buildGridElement(BuildContext context, int position) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return ImageDisplay(list[position]);
        }));
      },
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                  child: Hero(
                    tag: list[position].imageURL,
                    child: Image(
                      width: double.maxFinite,
                      image: CachedNetworkImageProvider(list[position].imageURL) ,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(list[position].name,style: TextStyle(fontSize: 18),),
              SizedBox(
                height: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
