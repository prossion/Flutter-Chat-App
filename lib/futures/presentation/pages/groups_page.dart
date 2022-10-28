import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/common/build_search_field.dart';
import 'package:flutter_social_app/config/app_theme.dart';
import 'package:flutter_social_app/futures/data/model/user_model.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:flutter_social_app/page_const.dart';

class GroupsPage extends StatefulWidget {
  final String uid;

  const GroupsPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
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
                      setState(() {
                        _isSearch = true;
                      });
                    },
                    child: const Icon(Icons.search)),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, PageConst.createGroupPage,
              arguments: widget.uid);
        },
        child: const Icon(Icons.group_add_outlined),
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
              final user = users.firstWhere(
                  (element) => element.uid == widget.uid,
                  orElse: () => const UserModel());
              return BlocBuilder<GroupBloc, GroupState>(
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
                    loaded: (groups) {
                      final filteredGroups = groups
                          .where((group) =>
                              group.groupName
                                  .startsWith(_searchTextController.text) ||
                              group.groupName.startsWith(
                                  _searchTextController.text.toLowerCase()))
                          .toList();
                      return Column(
                        children: [
                          Expanded(
                            child: filteredGroups.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.group,
                                            size: 40,
                                            color:
                                                blackTextStyle.withOpacity(.4)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "No Group Created yet",
                                          style: TextStyle(
                                            color:
                                                blackTextStyle.withOpacity(.2),
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
                                          BlocProvider.of<GroupBloc>(context)
                                              .add(
                                            GroupEvent.joinGroupEvent(
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
                                              groupName: filteredGroups[index]
                                                  .groupName,
                                              uid: widget.uid,
                                              username: user.name,
                                              groupProfileImage:
                                                  filteredGroups[index]
                                                      .groupProfileImage,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ],
                      );
                    },
                    error: (e) => Center(
                      child: Text(e, style: const TextStyle(fontSize: 20)),
                    ),
                  );
                },
              );
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
