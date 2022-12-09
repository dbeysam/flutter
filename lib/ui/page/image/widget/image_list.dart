import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/image/collection_controller.dart';
import 'image_card.dart';

class ImageListWidget extends StatefulWidget {
  final bool isCollection;
  final bool isLiked;
  const ImageListWidget({
    Key? key,
    this.isCollection = false,
    this.isLiked = false,
  }) : super(key: key);

  @override
  State<ImageListWidget> createState() => _ImageListWidgetState();
}

class _ImageListWidgetState extends State<ImageListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionController>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.isCollection
              ? value.myCollection.length
              : value.myImages.length,
          itemBuilder: (context, index) => ImageCardWidget(
            myImage: widget.isCollection
                ? value.myCollection[index]
                : value.myImages[index],
          ),
        );
      },
    );
  }
}
