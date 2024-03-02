import 'package:flutter/material.dart';

class PageNavigationBar extends StatelessWidget {
  const PageNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Navigation Bar'),
      ),

      //drawer untuk menu samping
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Rizki Syaputra'),
                accountEmail: Text('rizki@udacoding.id'),
                currentAccountPicture: CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 65,
                  ),
                ),
              ),
              ListTile(
                //untuk di klik item nya
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageRow()));
                },
                title: Text("Row Widget"),
              ),
              Divider(),
              ListTile(
                title: Text("Column Widget"),
              ),
              Divider(),
              ListTile(
                title: Text("Row & Column"),
              ),
              Divider(),
              ListTile(
                title: Text("List Horizontal"),
              ),
              Divider(),
              ListTile(
                title: Text("Passing Data"),
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: MaterialButton(
          onPressed: () {
            //back ke page sebelumnya
            Navigator.pop(context);
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}

class PageRow extends StatelessWidget {
  const PageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Row'),
      ),

      //Row, Column, List
      body: Center(
        child: Row(
          //https://api.flutter.dev/flutter/widgets/Row-class.html
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.add_business_sharp),
            Icon(Icons.person),
            Icon(
              Icons.add_call,
              color: Colors.orange,
              size: 64,
            ),
          ],
        ),
      ),
    );
  }
}
