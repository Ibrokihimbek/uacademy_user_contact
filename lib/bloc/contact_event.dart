part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class AddContactEvent extends ContactEvent {
  final UserContact contactModel;

  const AddContactEvent({required this.contactModel});

  @override
  List<Object?> get props => [contactModel];
}

class UpdateContactEvent extends ContactEvent {
  final UserContact contactModel;

  const UpdateContactEvent({required this.contactModel});

  @override
  List<Object?> get props => [contactModel];
}

class DeleteContactEvent extends ContactEvent {
  final String contactId;

  const DeleteContactEvent({required this.contactId});

  @override
  List<Object?> get props => [contactId];
}