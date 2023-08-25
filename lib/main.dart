import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_contact_user/bloc/contact_bloc.dart';
import 'package:uacademy_contact_user/cubit/get_contact_cubit.dart';
import 'package:uacademy_contact_user/data/repository/user_contact_repository.dart';
import 'package:uacademy_contact_user/screens/contact/contact_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(
            contactsRepository: UserContactsRepository(
              firestore: FirebaseFirestore.instance,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => GetCardsCubit(
            contactsRepository: UserContactsRepository(
              firestore: FirebaseFirestore.instance,
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const ContactPage(),
      ),
    );
  }
}
