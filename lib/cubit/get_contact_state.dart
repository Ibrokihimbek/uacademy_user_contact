
import 'package:uacademy_contact_user/data/models/user_contact.dart';

abstract class GetContactState {}

class GetContactInitial extends GetContactState {}

class GetContactInLoading extends GetContactState {}

class GetContactInSuccess extends GetContactState {
  GetContactInSuccess({required this.contact});

  final List<UserContact> contact;
}