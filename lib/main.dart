import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/flavor.dart';

import 'counter.dart';

Color kPrimaryColor = Colors.lightBlue;
void main() {
  runApp(Provider<Flavor>.value(value: Flavor.prod, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChangeNotifierProvider<ValueNotifier<int>>(
            create: (context) => ValueNotifier(10),
            builder: (context, child) {
              return MyHomePage(title: Provider.of<Flavor>(context).toString());
            }));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Home page build');
    final ValueNotifier<int> _counter =
        Provider.of<ValueNotifier<int>>(context, listen: false);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 30),
                Consumer<ValueNotifier<int>>(
                  builder: (BuildContext _, counter, __) => Text(
                    '${counter.value} times',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _counter.value--;
                  },
                  child: Icon(Icons.arrow_drop_down,
                      color: Colors.white, size: 200),
                ),
                SizedBox(width: 0),
                GestureDetector(
                  onTap: () {
                    _counter.value++;
                  },
                  child:
                      Icon(Icons.arrow_drop_up, color: Colors.white, size: 200),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
