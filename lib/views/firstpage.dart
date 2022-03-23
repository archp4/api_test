import 'package:api_test/views/secondpage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isDataRecieve = false;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var response = await Dio()
                    .get(
                  "https://aws.rishabh.live/api/smit-whatsmydp/db/records.new.json",
                )
                    .then((value) async {
                  isDataRecieve = true;
                  data = value.data;
                  setState(() {});
                  await showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Alert!!"),
                      content: const Text("Data has been received"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        )
                      ],
                    ),
                  );
                });
              },
              child: const Text('Request A Data Form Api'),
            ),
            if (isDataRecieve)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SecondData(
                        data: data,
                      ),
                    ),
                  );
                },
                child: const Text('View Data'),
              )
          ],
        ),
      ),
    );
  }
}
