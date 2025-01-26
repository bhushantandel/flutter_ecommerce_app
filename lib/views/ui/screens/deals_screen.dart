import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/ui/components/drawer_component.dart';
import 'package:flutter_ecommerce_app/views/ui/screens/list_view_screen.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({super.key});

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> tabList = [
    const Tab(text: 'TOP'),
    const Tab(text: 'POPULAR'),
    const Tab(text: 'FEATURED'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Row(
          children: [
            Text('Deals'),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                print('Lets Search');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.search),
              ))
        ],
        bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            tabs: tabList),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ListViewScreen(
            tabIndex: 0,
          ),
          ListViewScreen(
            tabIndex: 1,
          ),
          ListViewScreen(
            tabIndex: 2,
          )
        ],
      ),
    );
  }
}
