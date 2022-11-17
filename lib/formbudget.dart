import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/drawer.dart';

class MyFormBudgetPage extends StatefulWidget {
  const MyFormBudgetPage({super.key});

  @override
  State<MyFormBudgetPage> createState() => _MyFromBudgetPageState();
}

class _MyFromBudgetPageState extends State<MyFormBudgetPage> {
  final _formKey = GlobalKey<FormState>();

  String? judul;
  int? nominal;
  String? selectedValue;
  DateTime waktu = DateTime.now();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'Pengeluaran', child: Text('Pengeluaran')),
      const DropdownMenuItem(value: 'Pemasukkan', child: Text('Pemasukkan'))
    ];
    return menuItems;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: drawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                onChanged: (String? value) {
                  setState(() {
                    judul = value!;
                  });
                },
                onSaved: (String? value){
                  setState(() {
                    judul = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty){
                    return 'Judul tidak boleh kosong!';
                  }
                  return null;
                },
              )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  labelText: 'Nominal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                  onChanged: (String? value) {
                    var n = int.parse(value!);
                    setState(() {
                      nominal = n;
                    });
                  },
                  onSaved: (String? value) {
                    var n = int.parse(value!);
                    setState(() {
                      nominal = n;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty){
                      return 'Nominal tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: DropdownButtonFormField(
                    hint: const Text('Pilih Jenis'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    items: dropdownItems,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    onSaved: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    validator: (String? newValue) {
                      if (newValue == 'Pilih Jenis'){
                        return 'Jenis tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("${waktu.day}/${waktu.month}/${waktu.year}"),
                IconButton (
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2030),
                      ). then((date) {
                        setState(() {
                          waktu = date!;
                        });
                      });
                  },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      var data = Model(judul!, nominal!, selectedValue!, waktu);
                      ModelList.list.add(data);
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text('Simpan')),
            ],
          ),
        )),
      ),
    );
  }
}