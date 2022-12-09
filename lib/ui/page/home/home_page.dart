import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/image/collection_controller.dart';
import '../user/widget/profile_widget.dart';
import '../image/widget/image_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  Container bottomTabBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 30, top: 6),
      child: TabBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: [
          tabItem(Icons.home),
          tabItem(Icons.bookmark),
          tabItem(Icons.person),
        ],
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.white,
      ),
    );
  }

  Tab tabItem(IconData icon) {
    return Tab(icon: Icon(icon, size: 30));
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      foregroundColor: Colors.black87,
      backgroundColor: Colors.white,
      elevation: 0,
      title: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            contentPadding: kTabLabelPadding,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(
                kRadialReactionRadius,
              )),
            ),
            fillColor: Colors.grey.withOpacity(0.15),
            filled: true,
            hintText: 'Search for amazing content',
            hintStyle: const TextStyle(color: Colors.black26),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.black26,
              size: 22,
            )),
      ),
    );
  }

  TabBarView body() {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        ImageListWidget(),
        ImageListWidget(isLiked: true),
        ProfileWidget()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CollectionController(),
      child: DefaultTabController(
        animationDuration: Duration.zero,
        length: 3,
        child: Scaffold(
            appBar: currentIndex == 2 ? null : appBar(),
            body: body(),
            bottomNavigationBar: bottomTabBar()),
      ),
    );
  }
}
