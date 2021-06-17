import 'package:bloc_example/blocs/contact_bloc/ContactBloc.dart';
import 'package:bloc_example/model/Contact.dart';
import 'package:bloc_example/screen/widget/ListContact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2 extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2"),),
      body: Center(
        child: BlocConsumer<ContactBloc, List<Contact>>(
            builder: (context, listContact) {
              return ListContact(listContact);
            },
            listener: (BuildContext context, listContact) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add")));
            }),
      ),
    );
  }
}