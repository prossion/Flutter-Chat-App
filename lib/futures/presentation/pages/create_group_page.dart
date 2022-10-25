// ignore_for_file: avoid_print, invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/common/text_form_field_widget.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/storage_provider.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupPage extends StatefulWidget {
  final String uid;
  const CreateGroupPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _numberUsersJoinController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _examTypeController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  File? _image;
  // ignore: unused_field
  String? _profileUrl;

  Future getImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);

          StorageProviderRemoteDataSource.uploadFile(file: _image!)
              .then((value) {
            setState(() {
              _profileUrl = value;
            });
          });
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "error $e", backgroundColor: Colors.grey);
    }
  }

  @override
  void dispose() {
    _examTypeController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _passwordController.dispose();
    _numberUsersJoinController.dispose();
    _numberController.dispose();
    _passwordAgainController.dispose();
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: const Text("Create group"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                getImage();
              },
              child: Column(
                children: [
                  Container(
                    height: 62,
                    width: 62,
                    decoration: const BoxDecoration(
                      color: picturePhoto,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: profileWidget(image: _image)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Add Group Image',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            TextFormFieldWidget(
              controller: _groupNameController,
              type: TextInputType.text,
              hintText: 'group name',
              prefixIcon: Icons.change_circle,
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormFieldWidget(
              controller: _numberUsersJoinController,
              type: TextInputType.emailAddress,
              hintText: 'number of users join group',
              prefixIcon: Icons.format_list_numbered,
              obscureText: false,
            ),
            const SizedBox(
              height: 17,
            ),
            const Divider(
              thickness: 2,
              indent: 120,
              endIndent: 120,
            ),
            const SizedBox(
              height: 17,
            ),
            InkWell(
              onTap: () {
                _submit();
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                height: 44,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Create New Group',
                  style: TextStyle(
                      color: whiteTextStyle,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      )),
    );
  }

  _submit() async {
    formKey.currentState?.save();

    if (formKey.currentState!.validate()) {
      if (_image != null ||
          _groupNameController.text.isNotEmpty ||
          _numberUsersJoinController.text.isNotEmpty) {
        BlocProvider.of<GroupBloc>(context).add(GroupEvent.getCreateEvent(
            groupEntity: GroupEntity(
          lastMessage: "",
          uid: widget.uid,
          groupName: _groupNameController.text,
          creationTime: Timestamp.now(),
          groupProfileImage: _profileUrl!,
          joinUsers: "0",
          limitUsers: _numberUsersJoinController.text,
        )));
        Fluttertoast.showToast(
            msg: "${_groupNameController.text} created successfully",
            backgroundColor: Colors.grey);
        _clear();
      } else {
        Fluttertoast.showToast(
            msg: 'Group has not been created', backgroundColor: Colors.grey);
      }
    }

    //   if (_image == null) {
    //     Fluttertoast.showToast(
    //         msg: 'Add a group photo', backgroundColor: Colors.grey);
    //     return;
    //   }
    //   if (_groupNameController.text.isEmpty) {
    //     Fluttertoast.showToast(
    //         msg: 'Enter group name', backgroundColor: Colors.grey);
    //     return;
    //   }
    //   if (_numberUsersJoinController.text.isEmpty) {
    //     Fluttertoast.showToast(
    //         msg: 'Enter the amount of users', backgroundColor: Colors.grey);
    //     return;
    //   }
  }

  void _clear() {
    setState(() {
      _groupNameController.clear();
      _numberUsersJoinController.clear();
      _profileUrl = "";
      _image = null;
    });
  }
}
