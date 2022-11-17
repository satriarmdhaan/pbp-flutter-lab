import 'package:flutter/material.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/drawer.dart';

class MyBudgetDataPage extends StatefulWidget {
  const MyBudgetDataPage({super.key});

  @override
  State<MyBudgetDataPage> createState() => _MyBudgetDataPageState();
}

class _MyBudgetDataPageState extends State<MyBudgetDataPage> {
  var data = ModelList.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: drawer(context),
        body: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: data.length,
            itemBuilder: ((context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                shadowColor: Colors.black,
                elevation: null,
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].judul,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data[index].nominal.toString(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                                "${data[index].waktu.day}/${data[index].waktu.month}/${data[index].waktu.year}"),
                            Text(data[index].selectedValue),
                          ],
                        )
                      ],
                    )),
              );
            })));
  }
}
