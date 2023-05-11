import 'package:custom_tab_border/custom-tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _profileHeader(),
            _customTabBar(),
            _getPageByIndex(selectedTabIndex)
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() => Container(
        height: 200,
        color: Colors.black26,
        child: Center(
          child: Text('Profile header'),
        ),
      );

  Widget _customTabBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTab(
            name: 'Profile',
            isSelected: selectedTabIndex == 0,
            isFirst: true,
            onTap: () {
              setState(() {
                selectedTabIndex = 0;
              });
            },
          ),
          CustomTab(
            name: 'Experience',
            isSelected: selectedTabIndex == 1,
            isFirst: false,
            onTap: () {
              setState(() {
                selectedTabIndex = 1;
              });
            },
          ),
        ],
      );

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return _profilePage();
      case 1:
        return _experiencePage();
      default:
        return _profilePage();
    }
  }

  Widget _profilePage() => Expanded(
    child: Container(
          color: Colors.white,
          child: Center(
            child: Text('Profile Page Placeholder'),
          ),
        ),
  );

  Widget _experiencePage() => Expanded(
    child: Container(
          color: Colors.white,
          child: Center(
            child: Text('Experience Page Placeholder'),
          ),
        ),
  );
}
