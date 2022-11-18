import 'package:flutter/material.dart';

import 'tabs/tab1.dart';
import 'tabs/tab2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int counter = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic App Layout'),
        leading: const Icon(Icons.code),
        bottom: TabBar(
            controller: tabController,
            tabs: [
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(Icons.home)),
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(Icons.comment)),
            ]
        ),
      ),
      body: TabBarView(
          controller: tabController,
          children: const [
            Tab(
              child: Tab1(),
            ),
            Tab(
              child: Tab2(),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.blue,
        child: Center(
          child: Text('Counter = $counter'),
        ),
      ),
    );
  }
}
