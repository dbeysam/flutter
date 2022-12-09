import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/image/collection_controller.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight * 2, horizontal: 30),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: const NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2Fluffy-icons-like-or-reblog-if-you--742882901041217782%2F&psig=AOvVaw3O29kySuyOm76DRQ9yV_ik&ust=1670666918017000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIDww7Sl7PsCFQAAAAAdAAAAABAZ',
                    ))),
            const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 6.0),
                child: Text(
                  'Monkey D Luffy',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Text(
              'One Piece',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 30,
            ),
            listTile('My Membership', Icons.star_border_outlined),
            const Divider(),
            Consumer<CollectionController>(
              builder: (context, value, child) {
                return listTile('My Collection (${value.myCollection.length})',
                    Icons.bookmark_outline);
              },
            ),
            const Divider(),
            Consumer<CollectionController>(
              builder: (context, value, child) {
                return listTile('My Likes (${value.myEmojis.length})',
                    Icons.emoji_emotions_outlined);
              },
            ),
            const Divider(),
            listTile('Logout', Icons.logout, color: Colors.red),
          ],
        ),
      ),
    );
  }

  ListTile listTile(
    String title,
    IconData icon, {
    Color color = Colors.black,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
