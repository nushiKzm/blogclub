import 'package:blog_club/pages/article.dart';
import 'package:blog_club/pages/home.dart';
import 'package:blog_club/pages/profile.dart';
import 'package:blog_club/pages/simple.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({
    super.key,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;

class _RootScreenState extends State<RootScreen> {
  int selectedTabIndex = homeIndex;
  void updateSelectedBottomNavigationItem(int index) {
    setState(() {
      _history.remove(selectedTabIndex);
      _history.add(selectedTabIndex);
      selectedTabIndex = index;
    });
  }

  final List<int> _history = [];

  GlobalKey<NavigatorState> _homekey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homekey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedTabIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedTabIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: selectedTabIndex,
          children: [
            _navigator(_homekey, homeIndex, const HomeScreen()),
            _navigator(_articleKey, articleIndex, const ArticleScreen()),
            _navigator(
                _searchKey,
                searchIndex,
                SimpleScreen(
                  tabName: 'search',
                )),
            _navigator(_profileKey, profileIndex, const ProfileScreen()),
          ],
        ),
        bottomNavigationBar: _BottomNavigation(
          itemOnTap: updateSelectedBottomNavigationItem,
          selectedIndex: selectedTabIndex,
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedTabIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: selectedTabIndex != index,
                child: child,
              ),
            ),
          );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) itemOnTap;
  final int selectedIndex;
  const _BottomNavigation(
      {super.key, required this.itemOnTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 65,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: const Color(0x2D2D2D24).withOpacity(0.14), //14.14% //?
              )
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationItem(
                  iconFileName: 'Home.png',
                  activeIconFileName: 'HomeActive.png',
                  isActive: selectedIndex == homeIndex,
                  title: 'Home',
                  onTap: () {
                    itemOnTap(homeIndex);
                  },
                ),
                BottomNavigationItem(
                  iconFileName: 'Article.png',
                  activeIconFileName: 'ArticleActive.png',
                  isActive: selectedIndex == articleIndex,
                  title: 'Article',
                  onTap: () {
                    itemOnTap(articleIndex);
                  },
                ),
                const Expanded(child: SizedBox()),
                BottomNavigationItem(
                  iconFileName: 'Search.png',
                  activeIconFileName: 'SearchActive.png',
                  isActive: selectedIndex == searchIndex,
                  title: 'Search',
                  onTap: () {
                    itemOnTap(searchIndex);
                  },
                ),
                BottomNavigationItem(
                  iconFileName: 'Menu.png',
                  activeIconFileName: 'MenuActive.png',
                  isActive: selectedIndex == profileIndex,
                  title: 'Menu',
                  onTap: () {
                    itemOnTap(profileIndex);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: (MediaQuery.of(context).size.width / 2) - 32.5,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: const Color(0xff376AED),
                borderRadius: BorderRadius.circular(32.5),
                border: Border.all(color: Colors.white, width: 5),
              ),
              child: Image.asset('assets/img/icons/plus.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final bool isActive;
  final String title;
  final void Function() onTap;
  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '$title',
              style: themeData.textTheme.labelSmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.labelSmall!.color),
            ),
          ],
        ),
      ),
    );
  }
}
