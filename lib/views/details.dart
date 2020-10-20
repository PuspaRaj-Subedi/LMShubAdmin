import 'package:LMShubAdmin/controllers/book_details_controller.dart';
import 'package:LMShubAdmin/controllers/user_controller.dart';
import 'package:LMShubAdmin/models/route_argument.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BookDetailWidget extends StatefulWidget {
  RouteArgument routeArgument;

  BookDetailWidget({Key key, this.routeArgument}) : super(key: key);

  @override
  _BookDetailWidgetState createState() => _BookDetailWidgetState();
}

class _BookDetailWidgetState extends StateMVC<BookDetailWidget> {
  BookDetailsController _con;

  _BookDetailWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () => null,
          heroTag: null,
        ),
        SizedBox(
          width: 20,
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Container(
              child: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Theme.of(context).accentColor,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Theme.of(context).accentColor,
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).primaryColor),
                        child: Icon(Icons.arrow_back),
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 60),
                          width: 225,
                          height: 172,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/images/libary.png'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: EdgeInsets.only(top: 24, left: 25),
                child: Text(
                  _con.book.title ?? 'Book Title',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w600),
                )),
            Padding(
                padding: EdgeInsets.only(top: 24, left: 25),
                child: Text(_con.book.author ?? 'Author',
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).focusColor,
                        fontWeight: FontWeight.w400))),
            Container(
                height: 20,
                margin: EdgeInsets.only(top: 23, bottom: 36),
                padding: EdgeInsets.only(left: 25),
                child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      labelPadding: EdgeInsets.all(0),
                      indicatorPadding: EdgeInsets.all(0),
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Theme.of(context).focusColor,
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      unselectedLabelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 26),
                            child: Text(''),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 26),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ))),
            Padding(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: Text(
                    'Rich Dad Poor Dad is a 1997 book written by Robert Kiyosaki and Sharon Lechter. It advocates the importance of financial literacy (financial education), financial independence and building wealth through investing in assets, real estate investing, starting and owning businesses, as well as increasing ones financial intelligence (financial IQ) to improve ones business and financial aptitude. Robert Kiyosaki followed the book with Rich Dads Cashflow Quadrant and Rich Dads Guide to Investing. He has at least a dozen books published.',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).focusColor,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                        height: 2)))
          ]))
        ],
      ))),
    );
  }
}
