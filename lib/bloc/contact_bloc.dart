import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_contact_user/data/models/user_contact.dart';
import 'package:uacademy_contact_user/data/repository/user_contact_repository.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc({required this.contactsRepository})
      : super(const ContactState()) {
    on<AddContactEvent>(_addContact);
    on<UpdateContactEvent>(_updateContact);
    on<DeleteContactEvent>(_deleteContact);
  }

  final UserContactsRepository contactsRepository;

  _addContact(AddContactEvent event, Emitter<ContactState> emit) async {
    emit(state.copyWith(status: ContactStateStatus.loading));
    contactsRepository.addContact(contactModel: event.contactModel);
    emit(state.copyWith(status: ContactStateStatus.cardAdded));
  }

  _updateContact(UpdateContactEvent event, Emitter<ContactState> emit) async {
    emit(state.copyWith(status: ContactStateStatus.loading));
    contactsRepository.updateContact(contactModel: event.contactModel);
    emit(state.copyWith(status: ContactStateStatus.cardUpdated));
  }

  _deleteContact(DeleteContactEvent event, Emitter<ContactState> emit) async {
    emit(state.copyWith(status: ContactStateStatus.loading));
    contactsRepository.deleteContact(docId: event.contactId);
    emit(state.copyWith(status: ContactStateStatus.cardDeleted));
  }
}
