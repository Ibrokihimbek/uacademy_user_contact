import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_contact_user/bloc/contact_bloc.dart';
import 'package:uacademy_contact_user/data/models/user_contact.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({super.key, required this.contact});

  final UserContact contact;

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.contact.name;
    emailController.text = widget.contact.email;
    phoneController.text = widget.contact.phone;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactBloc, ContactState>(
      listener: (context, state) {
        if (state.status == ContactStateStatus.cardUpdated) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Contact'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  )),
              TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  )),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.read<ContactBloc>().add(
                        UpdateContactEvent(
                          contactModel: UserContact(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            contactId: widget.contact.contactId,
                          ),
                        ),
                      );
                },
                child: const Text('Update Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
