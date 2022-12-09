import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/image/collection_controller.dart';
import '../../../../data/image/image.dart';

class ImageCardWidget extends StatelessWidget {
  final MyImage myImage;

  const ImageCardWidget({
    Key? key,
    required this.myImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: imageCardHeader(context),
            ),
            Image.network(
              myImage.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            imageCardFooter(),
          ],
        ),
      ),
    );
  }

  Padding imageCardFooter() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Consumer<CollectionController>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: IconButton(
                      onPressed: () {
                        value.emoji(myImage)
                            ? value.removeEmoji(myImage)
                            : value.addEmoji(myImage);
                      },
                      icon: Icon(
                        value.emoji(myImage)
                            ? Icons.emoji_emotions
                            : Icons.emoji_emotions_outlined,
                        color: value.emoji(myImage)
                            ? Colors.green
                            : Colors.grey.shade800,
                      ),
                    ),
                  );
                },
              ),
              Consumer<CollectionController>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      onPressed: () {
                        value.isMarked(myImage)
                            ? value.remove(myImage)
                            : value.add(myImage);
                      },
                      icon: Icon(
                        value.isMarked(myImage)
                            ? Icons.bookmark
                            : Icons.bookmark_outline_rounded,
                        color: value.isMarked(myImage)
                            ? Colors.teal
                            : Colors.grey.shade800,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Icon(
            Icons.arrow_circle_down_rounded,
            color: Colors.grey.shade800,
          ),
        ],
      ),
    );
  }

  Row imageCardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                backgroundImage: NetworkImage(myImage.avatarUrl),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                myImage.userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey.shade300)),
            ),
            child: const Text(
              'Follow',
              style: TextStyle(color: Colors.black54),
            ))
      ],
    );
  }
}
