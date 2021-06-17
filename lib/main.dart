import 'package:bloc_example/blocs/contact_bloc/ContactBloc.dart';
import 'package:bloc_example/blocs/contact_bloc/ContactBlocDelegate.dart';
import 'package:bloc_example/screen/Screen1.dart';
import 'package:bloc_example/screen/Screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = ContactBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ContactBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/screen1',
        routes: {
          '/screen1':(context)=>Screen1(),
          '/screen2':(context) => Screen2(),
        },
      ),
    );
  }
}
