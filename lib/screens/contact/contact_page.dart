import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_contact_user/bloc/contact_bloc.dart';
import 'package:uacademy_contact_user/cubit/get_contact_cubit.dart';
import 'package:uacademy_contact_user/cubit/get_contact_state.dart';
import 'package:uacademy_contact_user/screens/add_contact/add_contact.dart';
import 'package:uacademy_contact_user/screens/edit_contact/edit_contact.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddContactPage(),
                  ),
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: BlocBuilder<GetCardsCubit, GetContactState>(
        builder: (context, state) {
          return state is GetContactInSuccess
              ? ListView.separated(
                  itemCount: state.contact.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditContactPage(
                                contact: state.contact[index],
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<ContactBloc>().add(
                                DeleteContactEvent(
                                  contactId: state.contact[index].contactId,
                                ),
                              );
                        },
                        icon: Icon(Icons.delete),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.contact[index].name),
                          Text(state.contact[index].email),
                          const SizedBox(height: 8),
                        ],
                      ),
                      subtitle: Text(state.contact[index].phone),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
