
import 'package:bloc_example/model/Contact.dart';

enum ContactEvent{
  AddContact,
  DeleteContact,
  EditContact,
}

class ContactEventBloc{
  ContactEvent? event;
  Contact? contact;
  int? index;

  ContactEventBloc();

  ContactEventBloc.add(Contact addContact){
    this.event = ContactEvent.AddContact;
    this.contact = addContact;
  }

  ContactEventBloc.delete(int deleteIndex){
    this.event = ContactEvent.DeleteContact;
    this.index = deleteIndex;
  }

  ContactEventBloc.edit(Contact editContact){
    this.event = ContactEvent.EditContact;
    this.contact = editContact;
  }

}