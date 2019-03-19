import 'package:flutter/material.dart';
import 'package:flutter_workshop/HomePage.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOGIN'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/cm.png'),
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter Your user name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide()),
                )),
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide()))),
                Builder(
                  builder: (ctx){
                    return RaisedButton(
                      child: Text('LOGIN'),
                      onPressed: () {
                        Navigator.of(ctx)
                            .push(MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
