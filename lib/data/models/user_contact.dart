class UserContact {
  final String contactId;
  final String name;
  final String email;
  final String phone;

  UserContact({
    required this.name,
    required this.email,
    required this.phone,
    required this.contactId,
  });

  factory UserContact.fromJson(Map<String, dynamic> json) {
    return UserContact(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      contactId: json['contactId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contactId': contactId,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
