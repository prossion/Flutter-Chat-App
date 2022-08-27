import 'package:flutter/material.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';

class GroupCard extends StatelessWidget {
  final GroupEntity group;
  final VoidCallback onTap;

  const GroupCard({Key? key, required this.group, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: profileWidget(
                            imageUrl: group.groupProfileImage,
                            name: group.groupName),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.groupName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          group.lastMessage == ""
                              ? group.groupName
                              : group.lastMessage.length > 40
                                  ? '${group.lastMessage.substring(0, 40)}...'
                                  : group.lastMessage,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 60, right: 10),
              child: Divider(
                thickness: 1.50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
