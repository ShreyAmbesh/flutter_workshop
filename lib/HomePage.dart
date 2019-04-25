import 'package:flutter/material.dart';
import 'package:flutter_workshop/GridItemModel.dart';
import 'package:flutter_workshop/ImageDisplay.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            body: FutureBuilder(
                future: getData(),
                builder: (ctx,snapshot){
              if(snapshot.hasData){
                return StaggeredGridView.countBuilder(
                    physics: BouncingScrollPhysics(),
                    staggeredTileBuilder: (index){
                      return StaggeredTile.fit(1);
                    },
                    itemCount: list.length,
                    crossAxisCount: 2,
                    itemBuilder: (context, position) {
                      return buildGridElement(context, position);
                    });
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            })));
  }

  Future<QuerySnapshot> getData() async {
    QuerySnapshot data = await Firestore.instance.collection('feed').where('title',isEqualTo: 'Karthik').getDocuments();

    data.documents.forEach((doc){
      list.add(GridItemModel(doc['title'], doc['imageURL']));
    });
    print(data.documents[0]['title']);
    return data;
  }

  var list = [];

  Widget buildGridElement(BuildContext context, int position) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ImageDisplay(list[position]);
        }));
      },
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Hero(
                  tag: list[position].imageURL,
                  child: Image(
                    width: double.maxFinite,
                    image:
                        CachedNetworkImageProvider(list[position].imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                list[position].name,
                style: TextStyle(fontSize: 18),
              ),
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
