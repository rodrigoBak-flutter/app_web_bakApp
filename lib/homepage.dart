import 'package:flutter/material.dart';
import 'package:app_porfolio_bakapp/utils/content_view.dart';
import 'package:app_porfolio_bakapp/utils/tab_controller_handler.dart';
import 'package:app_porfolio_bakapp/utils/view_wrapper.dart';
import 'package:app_porfolio_bakapp/views/about_view.dart';
import 'package:app_porfolio_bakapp/views/home_view.dart';
import 'package:app_porfolio_bakapp/views/projects_view.dart';
import 'package:app_porfolio_bakapp/widgets/bottom_bar.dart';
import 'package:app_porfolio_bakapp/widgets/custom_tab.dart';
import 'package:app_porfolio_bakapp/widgets/custom_tab_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  ItemScrollController? itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Inicio'),
      content: HomeView(),
    ),
    ContentView(
      tab: CustomTab(title: 'Sobre mi'),
      content: const AboutView(),
    ),
    ContentView(
      tab: CustomTab(title: 'Proyectos'),
      content: const ProjectsView(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');
    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      key: scaffoldKey,
      endDrawer: drawer(),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: ViewWrapper(
          desktopView: desktopView(),
          mobileView: mobileView(),
        ),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// Tab Bar
        Container(
          height: screenHeight * 0.05,
          child: CustomTabBar(
            controller: tabController!,
            tabs: contentViews.map((e) => e.tab).toList(),
          ),
        ),

        /// Tab Bar View
        Container(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController!,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),

        /// Bottom Bar
        const BottomBar()
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: Container(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                iconSize: screenWidth * 0.08,
                icon: Icon(Icons.menu_rounded),
                color: Colors.white,
                splashColor: Colors.transparent,
                onPressed: () => scaffoldKey.currentState!.openEndDrawer()),
            Expanded(
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.vertical,
                itemScrollController: itemScrollController,
                itemCount: contentViews.length,
                itemBuilder: (context, index) => contentViews[index].content,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Container(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: [Container(height: screenHeight * 0.1)] +
              contentViews
                  .map((e) => Container(
                        child: ListTile(
                          title: Text(
                            e.tab.title,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onTap: () {
                            itemScrollController!.scrollTo(
                                index: contentViews.indexOf(e),
                                duration: Duration(milliseconds: 300));
                            Navigator.pop(context);
                          },
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
