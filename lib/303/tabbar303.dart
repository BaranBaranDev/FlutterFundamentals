import 'package:flutter/material.dart';
import '../101/text_learn_view.dart';
import '../202/alert_learmn.dart';
import '../202/model.dart';
import '../202/sheet_learn.dart';

import 'feed.dart';

class TabAdvanceLearn extends StatefulWidget {
  const TabAdvanceLearn({Key? key}) : super(key: key);

  @override
  State<TabAdvanceLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabAdvanceLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: () {
          _tabController.animateTo(_MyTabViews.home.index);
        }),
        bottomNavigationBar: BottomAppBar(notchMargin: _notchedValue, child: _myTabView()),
        appBar: AppBar(),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [const FeedView(), SheetLearn(), ModelView(), TextLearnView()]); // sayfalar 
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}