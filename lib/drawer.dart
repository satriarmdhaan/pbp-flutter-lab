import 'package:counter_7/main.dart';
import 'package:counter_7/formbudget.dart';
import 'package:counter_7/budgetdata.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/watchlist.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            }),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyFormBudgetPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => const MyBudgetDataPage())),
            );
          },
        ),
        ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const MyWatchListPage())),
              );
          },
        )
      ],
    ),
  );
}
