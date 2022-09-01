// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/config/device_config.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/storage_provider.dart';
import 'package:flutter_social_app/futures/data/model/user_model.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/profile_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  TextEditingController? _statusController;
  TextEditingController? _emailController;
  TextEditingController? _numController;

  File? _image;
  String? _profileUrl;
  // ignore: unused_field
  String? _username;
  // ignore: unused_field
  String? _phoneNumber;
  final picker = ImagePicker();
  bool _imageIsPicked = false;

  @override
  void dispose() {
    _nameController!.dispose();
    _statusController!.dispose();
    _emailController!.dispose();
    _numController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameController = TextEditingController(text: "");
    _statusController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");
    _numController = TextEditingController(text: "");
    super.initState();
  }

  Future getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          StorageProviderRemoteDataSource.uploadFile(file: _image!)
              .then((value) {
            print("profileUrl");
            _imageIsPicked = true;
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
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoadedState) {
        return _profileWidget(state.users);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _profileWidget(List<UserEntity> users) {
    final user = users.firstWhere((user) => user.uid == widget.uid,
        orElse: () => const UserModel());
    _nameController!.value = TextEditingValue(text: user.name);
    _emailController!.value = TextEditingValue(text: user.email);
    _statusController!.value = TextEditingValue(text: user.status);
    final deviceData = DeviceData.init(context);
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                height: 82,
                width: 82,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: profileWidget(
                      imageUrl: user.photoUrl, image: _image, name: user.name),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Remove profile photo',
              style: TextStyle(
                  color: blueAccentTextStyle,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 28,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 22),
              height: 47,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: greyTextStyle.withOpacity(.2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                controller: _nameController,
                onChanged: (textData) {
                  _username = textData;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.person,
                    color: greyTextStyle,
                  ),
                  hintText: 'username',
                  hintStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 22),
              height: 47,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: AbsorbPointer(
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: greyTextStyle,
                    ),
                    hintText: 'email',
                    hintStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 22),
              height: 47,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                controller: _statusController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.text_decrease,
                    color: greyTextStyle,
                  ),
                  hintText: 'status',
                  hintStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Divider(
              thickness: 1,
              endIndent: 15,
              indent: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _updateProfile(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 22, right: 22),
                  alignment: Alignment.center,
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: blueAccentTextStyle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: whiteTextStyle),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _updateProfile(BuildContext context) {
    // formKey.currentState?.save();
    // if (formKey.currentState!.validate()) {
    //   if (_imageIsPicked || _profileUrl != null) {
    //     if (!_imageIsPicked) {
    //       if (_image != null) {
    //         BlocProvider.of<UserBloc>(context).add(GetUpdateUserEvent(
    //           user: UserEntity(
    //             uid: widget.uid,
    //             name: _nameController!.text,
    //             status: _statusController!.text,
    //             photoUrl: _profileUrl!,
    //           ),
    //         ));
    //         _profileUrl = null;
    //       } else {
    //         BlocProvider.of<UserBloc>(context).add(GetUpdateUserEvent(
    //           user: UserEntity(
    //             uid: widget.uid,
    //             name: _nameController!.text,
    //             status: _statusController!.text,
    //             photoUrl: '',
    //           ),
    //         ));
    //       }
    //     } else if (_imageIsPicked) {
    //       BlocProvider.of<UserBloc>(context).add(GetUpdateUserEvent(
    //         user: UserEntity(
    //           uid: widget.uid,
    //           name: _nameController!.text,
    //           status: _statusController!.text,
    //           photoUrl: _profileUrl!,
    //         ),
    //       ));
    //       _imageIsPicked = false;
    //       Fluttertoast.showToast(
    //           msg: 'Profile data has been changed',
    //           backgroundColor: Colors.grey);
    //     }
    //   }
    // }
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      if (_imageIsPicked || _profileUrl == null) {
        Fluttertoast.showToast(
            msg: 'Error changing profile', backgroundColor: Colors.grey);
      } else {
        BlocProvider.of<UserBloc>(context).add(GetUpdateUserEvent(
          user: UserEntity(
            uid: widget.uid,
            name: _nameController!.text,
            status: _statusController!.text,
            photoUrl: _profileUrl!,
          ),
        ));
        Fluttertoast.showToast(
            msg: 'Profile data has been changed', backgroundColor: Colors.grey);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing changed', backgroundColor: Colors.grey);
    }
  }
}
