import 'package:api_test/models/model.dart';
import 'package:flutter/material.dart';

class SecondData extends StatefulWidget {
  final List data;
  const SecondData({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SecondData> createState() => _SecondDataState();
}

class _SecondDataState extends State<SecondData> {
  late List<Model> list;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Local Data'),
      ),
      body: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          var data = Model.fromMap(widget.data[index]);
          return ListTile(
            title: Text(data.username),
            subtitle: Text("vistis :- " + data.visits.toString()),
          );
        },
      ),
    );
  }
}
