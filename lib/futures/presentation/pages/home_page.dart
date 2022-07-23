import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/auth/auth_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/group/group_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/group/group_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/user/user_bloc.dart';
import 'package:flutter_social_app/futures/presentation/bloc/user/user_event.dart';
import 'package:flutter_social_app/futures/presentation/pages/all_users_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/groups_page.dart';
import 'package:flutter_social_app/futures/presentation/pages/profile_page.dart';
import 'package:flutter_social_app/futures/presentation/widgets/custom_tab_bar.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchTextController = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> get pages => [
        GroupsPage(uid: widget.uid, query: _searchTextController.text),
        AllUsersPage(
          uid: widget.uid,
          query: _searchTextController.text,
        ),
        ProfilePage(
          uid: widget.uid,
        )
      ];

  int _currentPageIndex = 0;

  bool _isSearch = false;

  @override
  void dispose() {
    _searchTextController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GroupBloc>(context).add(GetGroupsEvent());
    BlocProvider.of<UserBloc>(context).add(GetUsersEvent());
    _searchTextController.addListener(() {
      setState(() {});
    });
  }

  _buildSearchField() {
    return Container(
      margin: const EdgeInsets.only(top: 65),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              offset: const Offset(0, 0.50))
        ],
      ),
      child: TextField(
        controller: _searchTextController,
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          prefixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isSearch = false;
                });
              },
              child: const Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.black,
              )),
          hintStyle: const TextStyle(),
        ),
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:
            _isSearch == false ? Colors.blueAccent : Colors.transparent,
        title: _isSearch == false
            ? const Text("Flutter Chat")
            : const SizedBox(
                height: 0.0,
                width: 0.0,
              ),
        flexibleSpace: _isSearch == true
            ? _buildSearchField()
            : const SizedBox(
                height: 0.0,
                width: 0.0,
              ),
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
                    child: const Icon(Icons.search)),
                const SizedBox(
                  width: 5,
                ),
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
                                .add(LoggetOutEvent());
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
              ]
            : [],
      ),
      body: Column(
        children: [
          _isSearch == false
              ? CustomTabBar(
                  index: _currentPageIndex,
                  tabClickListener: (index) {
                    _currentPageIndex = index;
                    _pageController.jumpToPage(index);
                  },
                )
              : const SizedBox(
                  width: 0.0,
                  height: 0.0,
                ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
