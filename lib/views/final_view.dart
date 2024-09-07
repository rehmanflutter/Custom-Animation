import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  late final ScrollController _scrollController;
  bool _atBottom = false;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SettingsPage(),
    const BuyPage(),
    const CategoryPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Scroll Listener
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _atBottom = true;
      });
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _atBottom = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      /// AppBar
      extendBody: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationView(
        onChangePage: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        curve: Curves.fastEaseInToSlowEaseOut,
        durationAnimation: const Duration(milliseconds: 400),
        backgroundColor: theme.scaffoldBackgroundColor,
        borderTopColor: Theme.of(context).brightness == Brightness.light
            ? _atBottom
                ? theme.primaryColor
                : null
            : null,
        color: theme.primaryColor,
        items: [
          ItemNavigationView(
              childAfter: Icon(
                IconlyBold.profile,
                color: theme.primaryColor,
                size: 35,
              ),
              childBefore: Icon(
                IconlyBroken.profile,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: Icon(
                IconlyBold.setting,
                color: theme.primaryColor,
                size: 35,
              ),
              childBefore: Icon(
                IconlyBroken.setting,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: Icon(
                IconlyBold.buy,
                color: theme.primaryColor,
                size: 35,
              ),
              childBefore: Icon(
                IconlyBroken.buy,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: Icon(
                IconlyBold.category,
                color: theme.primaryColor,
                size: 35,
              ),
              childBefore: Icon(
                IconlyBroken.category,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: Icon(
                IconlyBold.home,
                color: theme.primaryColor,
                size: 35,
              ),
              childBefore: Icon(
                IconlyBroken.home,
                color: Colors.grey,
                size: 30,
              )),
        ],
      ),
    );
  }

  /// AppBar
}

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/g2.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

/// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/g1.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

/// Buy Page
class BuyPage extends StatelessWidget {
  const BuyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/g3.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

/// Category Page
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/g4.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

/// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/g5.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
