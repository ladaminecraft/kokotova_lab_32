import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_32/first.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_)=> CharactersBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(      
          primarySwatch: Colors.pink,
        ),
        home:  MyHomePage(),
      ),
    );
  }
}