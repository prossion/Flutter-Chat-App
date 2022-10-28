import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/common/build_search_field.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/pages/my_chat_page.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:flutter_social_app/page_const.dart';

class AllUsersPage extends StatefulWidget {
  final String uid;
  const AllUsersPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  final TextEditingController _searchTextController = TextEditingController();

  bool _isSearch = false;

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      setState(() {});
    });
  }

  isSearch() {
    setState(() {
      _isSearch = false;
    });
  }

  String groupChatId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _isSearch == false
            ? const Text("Flutter Chat")
            : BuildSearchField(
                controller: _searchTextController, isSearch: isSearch),
        actions: _isSearch == false
            ? [
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        _isSearch = true;
                      },
                    );
                  },
                  child: const Icon(Icons.search),
                ),
                const SizedBox(
                  width: 11,
                ),
              ]
            : [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _searchTextController.clear();
                      _isSearch = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
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
            loaded: (users) {
              final user =
                  users.where((element) => element.uid != widget.uid).toList();
              final filteredUsers = user
                  .where((user) =>
                      user.name.startsWith(_searchTextController.text) ||
                      user.name
                          .startsWith(_searchTextController.text.toLowerCase()))
                  .toList();
              return BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: filteredUsers.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.account_box,
                                      size: 40,
                                      color: blackTextStyle.withOpacity(.4)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "No Users Found yet",
                                    style: TextStyle(
                                        color: blackTextStyle.withOpacity(.2)),
                                  )
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: filteredUsers.length,
                              itemBuilder: (_, index) {
                                if (filteredUsers[index].uid == widget.uid) {
                                  return const SizedBox.shrink();
                                } else {
                                  return ProfileCard(
                                    user: filteredUsers[index],
                                    onTap: () {
                                      String peerId = filteredUsers[index].uid;
                                      String currentUserId = widget.uid;
                                      if (currentUserId.compareTo(peerId) > 0) {
                                        groupChatId = '$currentUserId-$peerId';
                                      } else {
                                        groupChatId = '$peerId-$currentUserId';
                                      }
                                      BlocProvider.of<MyGroupBloc>(context).add(
                                          MyGroupEvent.updateDataFirestoreEvent(
                                        collectionPath: "groupChatChannel",
                                        docPath: groupChatId,
                                        dataNeedUpdate: {"recipientId": peerId},
                                      ));
                                      BlocProvider.of<MyGroupBloc>(context).add(
                                          MyGroupEvent.joinMyGroupEvent(
                                              groupChatId: groupChatId));
                                      Navigator.pushNamed(
                                        context,
                                        PageConst.myChatPage,
                                        arguments: MyChatPageArguments(
                                          peerId: filteredUsers[index].uid,
                                          peerAvatar:
                                              filteredUsers[index].photoUrl,
                                          peerNickname:
                                              filteredUsers[index].name,
                                          uid: widget.uid,
                                          groupChatId: groupChatId,
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                    ),
                  ],
                );
              });
            },
            error: (e) => Center(
              child: Text(e, style: const TextStyle(fontSize: 20)),
            ),
          );
        },
      ),
    );
  }
}
