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
  late String _photoUrl;
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
    _photoUrl = '';
    super.initState();
  }

  Future getImage() async {
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery).catchError((err) {
        Fluttertoast.showToast(
            msg: err.toString(), backgroundColor: Colors.grey);
      });

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          StorageProviderRemoteDataSource.uploadFile(file: _image!)
              .then((value) {
            print("profileUrl");
            _imageIsPicked = true;
            setState(() {
              _photoUrl = value;
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Flutter Chat"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  enabled: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      BlocProvider.of<AuthBloc>(context)
                          .add(const AuthEvent.loggedOut());
                    },
                    child: Row(
                      children: const [
                        Text('LogOut'),
                        Icon(Icons.logout, color: Colors.black)
                      ],
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return state.when(
          initial: () => Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )),
          loading: () => Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )),
          loaded: (users) => _profileWidget(users),
          error: (e) => Center(
            child: Text(e, style: const TextStyle(fontSize: 20)),
          ),
        );
      }),
    );
  }

  Widget _profileWidget(List<UserEntity> users) {
    void toggleSwitch(bool value) {
      setState(() {
        context.read<ThemeCubit>().switchTheme();
      });
    }

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
              child: Column(
                children: [
                  Container(
                    width: deviceData.screenHeight! * 0.12,
                    height: deviceData.screenHeight! * 0.12,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: profileWidget(
                          imageUrl: user.photoUrl,
                          image: _image,
                          name: user.name),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    'Change profile photo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
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
              height: 24,
            ),
            InkWell(
              onTap: () {
                _updateProfile(context, user.name, user.status, user.photoUrl);
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 22, right: 22),
                  alignment: Alignment.center,
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: whiteTextStyle),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              endIndent: 15,
              indent: 15,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Settings:',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 23,
                      color: Colors.grey.shade700),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  const Text('Change theme mode',
                      style: TextStyle(fontSize: 20)),
                  const Spacer(),
                  Switch.adaptive(
                      activeColor: Colors.grey,
                      value: context.read<ThemeCubit>().state ==
                              AppThemes.lightTheme
                          ? true
                          : false,
                      onChanged: toggleSwitch),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure to delete your account?"),
                      content: const Text(
                          "If you delete your account, you will delete your data and messages. Also, you will not be able to restore your account, only register a new account."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            child: const Text("Cancel"),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            BlocProvider.of<UserBloc>(context).add(
                                UserEvent.getDeleteUserEvent(uid: widget.uid));
                            BlocProvider.of<AuthBloc>(context)
                                .add(const AuthEvent.loggedOut());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            child: const Text("Okay"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Delete Account',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfile(
      BuildContext context, String name, String status, String photo) {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      if (_nameController!.text != name ||
          _statusController!.text != status ||
          _imageIsPicked) {
        BlocProvider.of<UserBloc>(context).add(UserEvent.getUpdateUserEvent(
          user: UserEntity(
            uid: widget.uid,
            name: _nameController!.text,
            status: _statusController!.text,
            photoUrl: _photoUrl,
          ),
        ));
        Fluttertoast.showToast(
            msg: 'Profile data has been changed', backgroundColor: Colors.grey);
      } else {
        Fluttertoast.showToast(
            msg: 'Nothing changed', backgroundColor: Colors.grey);
      }
    }
  }
}
