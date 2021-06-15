import 'package:flutter/material.dart';
import 'package:voa/pages/home/tabs/international_tab.dart';
import 'package:voa/pages/home/tabs/myanmar_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VOA'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(child: Text('မြန်မာ')),
            Tab(child: Text('နိုင်ငံတကာ')),
          ],
        ),
      ),
      body: TabBarView(
        physics: BouncingScrollPhysics(),
        controller: _tabController,
        children: [
          MyanmarTab(),
          InternationalTab(),
        ],
      ),
    );
  }
}
