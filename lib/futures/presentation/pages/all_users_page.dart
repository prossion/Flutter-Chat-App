import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/pages/my_chat_page.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:flutter_social_app/page_const.dart';

class AllUsersPage extends StatefulWidget {
  final String uid;
  final String? query;
  const AllUsersPage({Key? key, required this.uid, this.query})
      : super(key: key);

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  String groupChatId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadedState) {
            final users = state.users
                .where((element) => element.uid != widget.uid)
                .toList();
            final filteredUsers = users
                .where((user) =>
                    user.name.startsWith(widget.query!) ||
                    user.name.startsWith(widget.query!.toLowerCase()))
                .toList();
            return BlocBuilder<MyGroupBloc, MyGroupState>(
                builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: filteredUsers.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_box,
                                  size: 40,
                                  color: Colors.black.withOpacity(.4),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No Users Found yet",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.2),
                                  ),
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
                                    BlocProvider.of<MyGroupBloc>(context)
                                        .add(UpdateDataFirestoreEvent(
                                      collectionPath: "groupChatChannel",
                                      docPath: groupChatId,
                                      dataNeedUpdate: {"recipientId": peerId},
                                    ));
                                    BlocProvider.of<MyGroupBloc>(context).add(
                                        JoinMyGroupEvent(
                                            groupChatId: groupChatId));
                                    Navigator.pushNamed(
                                      context,
                                      PageConst.myChatPage,
                                      arguments: MyChatPageArguments(
                                        peerId: filteredUsers[index].uid,
                                        peerAvatar:
                                            filteredUsers[index].photoUrl,
                                        peerNickname: filteredUsers[index].name,
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
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
