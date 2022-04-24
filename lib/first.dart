import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_32/second.dart';

import 'bloc/bloc.dart';
import 'bloc/event.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("#breakingbadisthebest"),
      ),
      body: Center (
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: Colors.green,
            ),
          ),
          width: 600,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Get info about one of your 57 crushes',
                    style: TextStyle(fontSize: 25, color: Colors.pink)),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: SelectableText("Press here your crush id",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Your characters's id",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty || _controller.text.contains(' 0 ')
                   || _controller.text.contains(RegExp(r'[68-9999999999999999]'))) {
                    print("error");
                  } else {
                    String url = _controller.text;
                    context.read<CharactersBloc>().add(LoadDataEvent(url: url,));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(url: url)));
                    _controller.clear();
                  }
                },
                child: const Text("Let's try!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}