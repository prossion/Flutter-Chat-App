import 'package:flutter/material.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';

class ProfileCard extends StatelessWidget {
  final UserEntity user;
  final VoidCallback onTap;

  const ProfileCard({Key? key, required this.user, required this.onTap})
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
                            imageUrl: user.photoUrl, name: user.name),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          user.status == ""
                              ? "Hi! I'm using this app"
                              : user.status,
                          overflow: TextOverflow.ellipsis,
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
