import 'package:flutter/material.dart';
import 'package:kilogram/views/widgets/image.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 173,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 95, top: 30),
                    // child: ImageWidget(isOnline: false, imageUrl: currentUser.imageUrl)
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: EdgeInsets.only(left: 95),
                    child: Text("TestName",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              )
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                    )
                ),
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Header',
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text('Item 1'),
                      // selected: _selectedDestination == 0,
                      // onTap: () => selectDestination(0),
                    ),
                    ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Item 2'),
                      // selected: _selectedDestination == 1,
                      // onTap: () => selectDestination(1),
                    ),
                    ListTile(
                      leading: Icon(Icons.label),
                      title: Text('Item 3'),
                      // selected: _selectedDestination == 2,
                      // onTap: () => selectDestination(2),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Label',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.bookmark),
                      title: Text('Item A'),
                      // selected: _selectedDestination == 3,
                      // onTap: () => selectDestination(3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
