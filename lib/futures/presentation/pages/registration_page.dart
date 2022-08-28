// import 'dart:io';

import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/storage_provider.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/pages/home_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/login_page.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _examTypeController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _hidePass = true;

  File? _image;
  String? _profileUrl;

  Future getImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(
        () {
          if (pickedFile != null) {
            _image = File(pickedFile.path);
            StorageProviderRemoteDataSource.uploadFile(file: _image!)
                .then((value) {
              setState(() {
                _profileUrl = value;
              });
            });
          } else {
            const photo = 'assets/icons/profile_default.png';
            setState(() {
              _profileUrl = photo;
            });
          }
        },
      );
    } catch (e) {
      Text("error $e");
    }
  }

  @override
  void dispose() {
    _examTypeController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordAgainController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: BlocConsumer<CredentialBloc, CredentialState>(
        listener: (context, state) {
          if (state is CredentialSuccessState) {
            BlocProvider.of<AuthBloc>(context).add(LoggedInEvent());
          }
        },
        builder: (context, state) {
          if (state is CredentialLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CredentialSuccessState) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthenticatedState) {
                  return HomePage(uid: state.uid);
                } else {
                  return _bodyWidget();
                }
              },
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }

  Widget _bodyWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
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
                      'Add profile photo',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: "Username",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Email",
                        controller: _emailController,
                        type: TextInputType.emailAddress,
                        prefixIcon: Icons.mail,
                        obscureText: false,
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
                              ? 'Enter a valid email'
                              : null;
                        },
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
                      TextFormFieldWidget(
                        hintText: "Password",
                        controller: _passwordController,
                        type: TextInputType.text,
                        prefixIcon: Icons.password,
                        obscureText: _hidePass,
                        suffixIcon: IconButton(
                          icon: Icon(_hidePass
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _hidePass = !_hidePass;
                            });
                          },
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? 'Enter min. 6 characters'
                              : null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Password Again",
                        controller: _passwordAgainController,
                        type: TextInputType.text,
                        prefixIcon: Icons.password,
                        obscureText: _hidePass,
                        suffixIcon: IconButton(
                          icon: Icon(_hidePass
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _hidePass = !_hidePass;
                            });
                          },
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? 'Enter min. 6 characters'
                              : null;
                        },
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            _submitSignUp();
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              (route) => false);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submitSignUp() {
    BlocProvider.of<CredentialBloc>(context).add(SignUpEvent(
      user: UserEntity(
        email: _emailController.text,
        phoneNumber: _numberController.text,
        name: _usernameController.text,
        photoUrl: _profileUrl!,
        password: _passwordController.text,
        isOnline: false,
        status: "Hi! there i'm using this app",
      ),
    ));
  }
}
