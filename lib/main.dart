import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'DataSoup.dart';

class Constants{
   
}

void main() {
  runApp(MyApp());

  //状态栏
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // if(Platform.isAndroid){
  //       SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  //       statusBarColor: Colors.blue,
  //   );
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     
      home: MyHomePage(title: '你好'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String rootPageContent = "none";

  @override
  void initState() {
    super.initState();
    print("initState");
    
    fetchData();
  }

  void fetchData() async {
    HtmlDataSoup soup = HtmlDataSoup();
    String content = await soup.parsePage();

    setState(() {
      rootPageContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Text(
            rootPageContent,
            overflow: TextOverflow.clip
          )
        ),

        // child: Text(
        //   rootPageContent,
        //   overflow: TextOverflow.clip
        // ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
            
      //     ],
      //   ),
      // )
    );
  }
}
