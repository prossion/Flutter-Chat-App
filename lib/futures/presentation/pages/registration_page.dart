import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/common/text_form_field_widget.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/pages/login_page.dart';

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
  final TextEditingController _numberController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _hidePass = true;

  @override
  void dispose() {
    _examTypeController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: BlocConsumer<CredentialBloc, CredentialState>(
        listener: (context, state) {
          state.when(
            initial: () => Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )),
            loading: () => Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )),
            success: () {
              BlocProvider.of<AuthBloc>(context)
                  .add(const AuthEvent.loggedIn());
            },
            error: (e) => {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Ooops...'),
                    content: Text(e),
                  );
                },
              )
            },
          );
        },
        builder: (context, state) {
          state.when(
            initial: () => Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )),
            loading: () => Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )),
            success: () => _bodyWidget(),
            error: (e) => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Ooops...'),
                  content: Text(e),
                );
              },
            ),
          );
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
                  'Create an Account',
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
                      const SizedBox(height: 12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            _submitSignUp();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                          ),
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
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              (route) => false);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor)),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: whiteTextStyle),
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
    BlocProvider.of<CredentialBloc>(context).add(CredentialEvent.signUpEvent(
      user: UserEntity(
        email: _emailController.text,
        phoneNumber: _numberController.text,
        name: _usernameController.text,
        password: _passwordController.text,
        isOnline: false,
        status: "Hi! there i'm using this app",
      ),
    ));
  }
}
