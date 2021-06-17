import 'dart:ffi';

import 'package:bloc_example/blocs/contact_bloc/ContactEvent.dart';
import 'package:bloc_example/model/Contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class ContactBloc extends Bloc<ContactEventBloc,List<Contact>>{

  ContactBloc() : super([]);

  @override
  Stream<List<Contact>> mapEventToState(ContactEventBloc event) async*{
    switch(event.event){
      case ContactEvent.AddContact:{
        final logger = Logger();
        logger.i("this shit must run ");
        List<Contact> newState = state;
        if(event.contact != null){
          newState.add(event.contact!);
        }
        yield newState;
        break;
      }
      case ContactEvent.DeleteContact:{
        List<Contact> newState = state;
        if(event.index != null){
          newState.removeAt(event.index!);
        }
        yield newState;
        break;
      }
      case ContactEvent.EditContact:{
        List<Contact> newState = List.from(state);
        if(event.contact != null){
          newState.add(event.contact!);
        }
        yield newState;
        break;
      }
      default:{
        throw Exception("Event not found");
      }
    }
  }

}