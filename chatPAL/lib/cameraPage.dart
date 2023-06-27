import 'package:chatpal/photoTab.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

class cameraPage extends StatefulWidget {
  const cameraPage({Key? key}) : super(key: key);

  @override
  State<cameraPage> createState() => _cameraPageState();
}

class _cameraPageState extends State<cameraPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: const [
              photoTab(),
              Center(child: Text('Tweet')),
            ],
          ),
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  titleSpacing: 0,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TabBar(
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            isScrollable: true,
                            labelColor: Colors.white,
                            tabs: const [
                              Tab(
                                child: SizedBox(
                                  height: 24,
                                  width: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Photo',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: SizedBox(
                                  height: 24,
                                  width: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Tweet',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

