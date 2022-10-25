import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/common/text_form_field_widget.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/pages/pages.dart';
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
            success: () => _widgetBuild(),
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
          return _widgetBuild();
        },
      ),
    );
  }

  Widget _widgetBuild() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )),
          loading: () => Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )),
          auth: (uid) => HomePage(uid: uid),
          unAuth: () {
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
                                prefixIcon: Icons.mail,
                                type: TextInputType.emailAddress,
                                obscureText: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return value != null && value.length < 6
                                      ? 'Enter min. 6 characters'
                                      : null;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, PageConst.forgotPage);
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _submitLogin();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context).primaryColor),
                                  ),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    PageConst.registrationPage,
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor),
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: whiteTextStyle),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<CredentialBloc>(context)
                              .add(const CredentialEvent.googleAuthEvent());
                        },
                        child: Ink(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                ImageIcon(
                                  AssetImage("assets/icons/google.png"),
                                  color: whiteTextStyle,
                                ),
                                SizedBox(width: 12),
                                Text('Sign in with Google',
                                    style: TextStyle(color: whiteTextStyle)),
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
          },
        );
      },
    );
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<CredentialBloc>(context).add(CredentialEvent.signInEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
  }
}
