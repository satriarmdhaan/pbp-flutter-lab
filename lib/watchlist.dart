import 'dart:convert';
import 'package:counter_7/details.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/watchlistmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WatchListNavigator extends StatelessWidget {
  const WatchListNavigator({super.key, required this.data});
  final WatchlistModel data;
  @override
  Widget build(BuildContext context) {
    return 
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: 
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => WatchDetailPage(watchData: data)))
              );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(data.title.toString()),
          )
        ), 
      );
  }
}

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
Future<List<WatchlistModel>> readWatchlistModel() async{
  final String response = await rootBundle.loadString('lib/fixtures/initial_mywatchlist_data.json');
  final list = jsonDecode(response) as List<dynamic>;

  return list.map((e) => WatchlistModel.fromJson(e)).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: drawer(context),
      body: FutureBuilder<List<WatchlistModel>>(
        future: readWatchlistModel(),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}")
            );
          } else if(snapshot.hasData) {
            var items = snapshot.data!;
            return ListView.builder(
              itemBuilder: ((context, index) =>
                WatchListNavigator(data: items[index])),
              itemCount: items.length,
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
              );
          }
        }
        ),
      );
  }
}