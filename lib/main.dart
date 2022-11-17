import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: drawer(context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_counter % 2 == 1)
                const Text('GANJIL', style: TextStyle(color: Colors.blue))
              else
                const Text('GENAP', style: TextStyle(color: Colors.red)),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _visible,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_counter == 1) {
                          setState(() {
                            _visible = false;
                            _counter = 0;
                          });
                        } else if (_counter > 1) {
                          setState(() {
                            _counter--;
                            _visible = true;
                          });
                        }
                      },
                      tooltip: 'Decrement',
                      heroTag: null,
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _counter++;
                        _visible = true;
                      });
                    },
                    tooltip: 'Increment',
                    heroTag: null,
                    child: const Icon(Icons.add),
                  ),
                ])));
  }
}
