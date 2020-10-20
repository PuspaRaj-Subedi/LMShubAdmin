import 'package:LMShubAdmin/controllers/book_controller.dart';
import 'package:LMShubAdmin/controllers/profile_controller.dart';
import 'package:LMShubAdmin/elements/DrawerWidget.dart';
import 'package:LMShubAdmin/elements/LoadingWidget.dart';
import 'package:LMShubAdmin/models/route_argument.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LibaryWidget extends StatefulWidget {
  @override
  _LibaryWidgetState createState() => _LibaryWidgetState();
}

class _LibaryWidgetState extends StateMVC<LibaryWidget> {
  BookController _con;

  _LibaryWidgetState() : super(BookController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        shadowColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).accentColor,
        title: Center(
          child: Column(children: [
            Text(
              'LMShub',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ]),
        ),
      ),
      drawer: DrawerWidget(),
      body: new Container(
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Text('Discover what You Need?',
                    style: TextStyle(
                      fontSize: 16,
                    ))),
            Container(
                height: 39,
                margin: EdgeInsets.only(left: 10, top: 25, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).accentColor),
                child: Stack(
                  children: [
                    TextField(
                        maxLengthEnforced: true,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 19, right: 50, bottom: 8),
                            border: InputBorder.none,
                            hintText: 'Search Book...',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ))),
                    // Positioned(
                    //   right: 0,
                    // ),
                    // Positioned(
                    //   top: 8,
                    //   right: 9,
                    //   child: Image.asset('assets/icons/search.png'),
                    // ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Books',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )),
            _con.books.isEmpty
                ? LoadingWidget(height: 500)
                : ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _con.books.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 19),
                          height: 81,
                          width: MediaQuery.of(context).size.width - 50,
                          color: Theme.of(context).primaryColor,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/BookDetails',
                                  arguments: RouteArgument(
                                      id: _con.books.elementAt(index).id));
                            },
                            child: Row(
                              children: [
                                Container(
                                    height: 81,
                                    width: 62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/libary.png')),
                                    )),
                                SizedBox(width: 21),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_con.books.elementAt(index).title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 5),
                                    Text(_con.books.elementAt(index).title)
                                  ],
                                ),
                                Column()
                              ],
                            ),
                          ));
                    }),
          ],
        ),
      ),
    );
  }
}
