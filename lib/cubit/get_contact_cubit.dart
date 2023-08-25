import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_contact_user/cubit/get_contact_state.dart';
import 'package:uacademy_contact_user/data/models/user_contact.dart';
import 'package:uacademy_contact_user/data/repository/user_contact_repository.dart';

class GetCardsCubit extends Cubit<GetContactState> {
  final UserContactsRepository contactsRepository;

  GetCardsCubit({required this.contactsRepository})
      : super(GetContactInitial()) {
    fetchAllContacts();
  }

  fetchAllContacts() {
    emit(GetContactInLoading());
    contactsRepository.getAllContacts().listen(
      (List<UserContact> cards) {
        emit(
          GetContactInSuccess(contact: cards),
        );
      },
    );
  }
}
