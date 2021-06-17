import 'package:bloc_example/blocs/contact_bloc/ContactBloc.dart';
import 'package:bloc_example/blocs/contact_bloc/ContactEvent.dart';
import 'package:bloc_example/model/Contact.dart';
import 'package:bloc_example/screen/widget/CustomTextFromField.dart';
import 'package:bloc_example/screen/widget/ListContact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen1 extends StatelessWidget {
  final phoneEditText = CustomTextFromField("Phone", TextInputType.number);
  final nameEditText = CustomTextFromField("name", TextInputType.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Navigator.pushNamed(context, '/screen2');
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              this.phoneEditText,
              this.nameEditText,
              BlocConsumer<ContactBloc, List<Contact>>(
                  builder: (context, listContact) {
                return ListContact(listContact);
              }, listener: (BuildContext context, listContact) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Add")));
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ContactBloc>(context).add(ContactEventBloc.add(
              Contact(int.parse(phoneEditText.textController.text),
                  nameEditText.textController.text)));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
