import 'package:auto_size_text/auto_size_text.dart';

import 'package:e_comerce_2/services/MyDBManager_services.dart';
import 'package:flutter/material.dart';

import '../models/user_register_class_models.dart';

import '../widgets/header_widget.dart';

class UsersListScreen extends StatelessWidget {
  UsersListScreen({Key? key}) : super(key: key);
  static const String usersListId = '/userListId';
  final formKey = GlobalKey<FormState>();
  final DBUserManager dbUserManager = DBUserManager();
  final double _headerHeight = 250;

  static String? email;
  static String? password;
  var userList;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: _headerHeight,
            child: HeaderWidget(_headerHeight, true,
                Icons.login_rounded), //let's create a common header widget
          ),
          SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.fromLTRB(
                    20, 10, 20, 10), // This will be the login form
                child: Column(
                  children: [
                    const Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    const AutoSizeText(
                      'verificate Your Email Address',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30.0),
                    ListView(
                      children: <Widget>[
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: <Widget>[
                                ElevatedButton(
                                  child: SizedBox(
                                      height: 25,
                                      width: width * 0.9,
                                      child: const AutoSizeText(
                                        "Submit",
                                        textAlign: TextAlign.center,
                                      )),
                                  onPressed: () {},
                                ),
                                FutureBuilder(
                                  future: dbUserManager.getUserList(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasData) {
                                        userList = snapshot.data;
                                        print(userList);
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: userList == null
                                              ? 0
                                              : userList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            UserRigester us = userList[index];
                                            return Card(
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: SizedBox(
                                                      width: width * 0.02,
                                                      child: Column(
                                                        children: <Widget>[
                                                          AutoSizeText(
                                                              'ID: ${us.emailAdress}'),
                                                          AutoSizeText(
                                                              'Name: ${us.firstName}'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        return const AutoSizeText(
                                          'No Data',
                                          style: TextStyle(fontSize: 40),
                                        );
                                      }
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
