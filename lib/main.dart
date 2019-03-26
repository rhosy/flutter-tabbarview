import 'package:flutter/material.dart';
import 'home.dart' as home;
import 'categories.dart' as categories;
import 'profile.dart' as profile;
import 'notification.dart' as notification;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Tabbar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Tabbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin  {

  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.home), text: 'Home',),
            new Tab(icon: Icon(Icons.category), text: "Categories",),
            new Tab(icon: Icon(Icons.person),text: "Profile",),
            new Tab(icon: Icon(Icons.notification_important),text: 'Notification',),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          home.Home(),
          categories.Categories(),
          profile.Profile(),
          notification.Notification(),
        ],
      ),
    );

  }
}
