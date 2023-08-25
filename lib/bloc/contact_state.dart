part of 'contact_bloc.dart';

class ContactState extends Equatable {
  const ContactState({
    this.status = ContactStateStatus.initial,
  });

  final ContactStateStatus status;

  ContactState copyWith({
    ContactStateStatus? status,
  }) {
    return ContactState(
      status: status ?? ContactStateStatus.initial,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}

enum ContactStateStatus {
  loading,
  initial,
  cardAdded,
  cardUpdated,
  cardDeleted,
  cardFetched,
}
