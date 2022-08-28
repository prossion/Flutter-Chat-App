import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/data/model/user_model.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:flutter_social_app/page_const.dart';

class GroupsPage extends StatefulWidget {
  final String uid;
  final String query;
  const GroupsPage({Key? key, required this.uid, required this.query})
      : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PageConst.createGroupPage,
              arguments: widget.uid);
        },
        child: const Icon(Icons.addchart_outlined),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadedState) {
            final user = state.users.firstWhere(
                (element) => element.uid == widget.uid,
                orElse: () => const UserModel());
            return BlocBuilder<GroupBloc, GroupState>(
              builder: (context, state) {
                if (state is GroupLoadedState) {
                  final filteredGroups = state.groups
                      .where((group) =>
                          group.groupName.startsWith(widget.query) ||
                          group.groupName
                              .startsWith(widget.query.toLowerCase()))
                      .toList();
                  return Column(
                    children: [
                      Expanded(
                        child: filteredGroups.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.group,
                                        size: 40,
                                        color: blackTextStyle.withOpacity(.4)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "No Group Created yet",
                                      style: TextStyle(
                                        color: blackTextStyle.withOpacity(.2),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: filteredGroups.length,
                                itemBuilder: (_, index) {
                                  return GroupCard(
                                    group: filteredGroups[index],
                                    onTap: () {
                                      BlocProvider.of<GroupBloc>(context).add(
                                        JoinGroupEvent(
                                          groupEntity: GroupEntity(
                                              groupId: filteredGroups[index]
                                                  .groupId),
                                        ),
                                      );
                                      Navigator.pushNamed(
                                        context,
                                        PageConst.singleChatPage,
                                        arguments: SingleChatEntity(
                                            groupId:
                                                filteredGroups[index].groupId,
                                            groupName:
                                                filteredGroups[index].groupName,
                                            uid: widget.uid,
                                            username: user.name),
                                      );
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
