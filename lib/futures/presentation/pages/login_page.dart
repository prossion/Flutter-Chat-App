import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/auth/auth_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_social_app/futures/presentation/bloc/credential/credential_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/credential/credential_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/credential/credential_state.dart';
import 'package:flutter_social_app/futures/presentation/pages/home_page.dart';
import 'package:flutter_social_app/futures/presentation/widgets/text_field_container.dart';

import 'package:flutter_social_app/page_const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePass = true;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          if (state is CredentialErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Ooops...'),
                  content: Text(state.error),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is CredentialLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CredentialSuccessState) {
            return _widgetBuild();
          }
          return _widgetBuild();
        },
      ),
    );
  }

  Widget _widgetBuild() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return HomePage(uid: state.uid);
        } else {
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
                        'Sign In',
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
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              hintText: "Email",
                              controller: _emailController,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                return value != null &&
                                        !EmailValidator.validate(value)
                                    ? 'Enter a valid email'
                                    : null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormFieldWidget(
                              hintText: "Password",
                              controller: _passwordController,
                              type: TextInputType.text,
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                                  _submitLogin();
                                },
                                child: const Text('Sign In'),
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
                            const Text("Don't have an account?",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  PageConst.registrationPage,
                                );
                              },
                              child: const Text(
                                'Sign Up',
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
                    InkWell(
                      onTap: () {
                        BlocProvider.of<CredentialBloc>(context)
                            .add(GoogleAuthEvent());
                      },
                      child: Ink(
                        color: const Color(0xFF397AF3),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: const [
                              ImageIcon(
                                AssetImage("assets/icons/google.png"),
                                color: Colors.white,
                              ),
                              SizedBox(width: 12),
                              Text('Sign in with Google',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<CredentialBloc>(context).add(SignInEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
  }
}
