import 'package:cat_api/view/photo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int currentTab = 0;
  final List _buildSrcreens = [
    const HomePage(),
    const PhotoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSrcreens[currentTab],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context,'/UploadPage');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                minWidth: 75,
                onPressed: (){
                  setState(() {
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentTab == 0
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.blue,),
                    ) :
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.grey,),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 11,
                          color: currentTab == 0
                              ? Colors.indigo
                              : Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 60,),
              MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                minWidth: 75,
                onPressed: (){
                  setState(() {
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentTab == 0
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.blue,),
                    ) :
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.grey,),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'My photos',
                      style: TextStyle(
                          fontSize: 11,
                          color: currentTab == 1
                              ? Colors.indigo
                              : Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


