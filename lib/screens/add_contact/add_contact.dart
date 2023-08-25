import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_contact_user/bloc/contact_bloc.dart';
import 'package:uacademy_contact_user/data/models/user_contact.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactBloc, ContactState>(
      listener: (context, state) {
        if (state.status == ContactStateStatus.cardAdded) {
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
                    AddContactEvent(
                      contactModel: UserContact(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        contactId: '',
                      ),
                    ),
                  );
                },
                child: const Text('Add Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
