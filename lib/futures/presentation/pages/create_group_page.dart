import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/text_field_container.dart';

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

  // ignore: unused_field
  String? _profileUrl;

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
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
      child: Column(
        children: [
          const SizedBox(
            height: 17,
          ),
          TextFormFieldWidget(
              controller: _groupNameController,
              type: TextInputType.text,
              hintText: 'group name',
              prefixIcon: Icons.change_circle),
          const SizedBox(
            height: 10,
          ),
          TextFormFieldWidget(
            controller: _numberUsersJoinController,
            type: TextInputType.emailAddress,
            hintText: 'number of users join group',
            prefixIcon: Icons.format_list_numbered,
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
            },
            child: Container(
              alignment: Alignment.center,
              height: 44,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.green,
              ),
              child: const Text(
                'Create New Group',
                style: TextStyle(
                    color: Colors.white,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'By clicking Create New Group, you agree to the ',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                'Privacy Policy',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'and ',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                'terms ',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'of use',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  _submit() async {
    // if (_image==null){
    //   Text('Add profile photo');
    //   return;
    // }
    if (_groupNameController.text.isEmpty) {
      const Text('enter your surname');
      return;
    }
    if (_numberUsersJoinController.text.isEmpty) {
      const Text('enter your email');
      return;
    }

    BlocProvider.of<GroupBloc>(context).add(GetCreateGroupEvent(
        groupEntity: GroupEntity(
      lastMessage: "",
      uid: widget.uid,
      groupName: _groupNameController.text,
      creationTime: Timestamp.now(),
      // groupProfileImage: _profileUrl!,
      joinUsers: "0",
      limitUsers: _numberUsersJoinController.text,
    )));
    Text("${_groupNameController.text} created successfully");
    _clear();
  }

  void _clear() {
    setState(() {
      _groupNameController.clear();
      _numberUsersJoinController.clear();
      _profileUrl = "";
      //  _image=null;
    });
  }
}
