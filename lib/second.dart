import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text(url),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CharactersBloc, CharactersState>(builder: (context, state) {
              if (state is InitialState) {
                return const Text('nothing to show');
              }
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is FailedState) {
                return Text(state.errorMessage);
              }
              if (state is LoadedState) {
                return Text(state.data[0]['name'].toString()+"\n"+state.data[0]['nickname'].toString()+"\n"+state.data[0]['birthday'].toString()+"\n");
              }
              return Container(
                height: 100,
                width: 100,
                color: Colors.red,
              );
            }),
            ],
          )),
        ),
      ),
    );
  }
}
