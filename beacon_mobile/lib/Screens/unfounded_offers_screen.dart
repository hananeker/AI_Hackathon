import 'package:flutter/material.dart';

class OffersNotFound extends StatefulWidget {
  static String route = '/nooffers';

  @override
  OffersNotFoundState createState() => OffersNotFoundState();
}

class OffersNotFoundState extends State<OffersNotFound> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle_sharp,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Color(0xFFFFE424),
        title: Center(
            child: Text(
          "Offers",
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600),
        )),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 340.0, bottom: 160),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/9');
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 35,
                  )),
            ),
            Image.asset("images/sad.jpg"),
            SizedBox(
              height: 30,
            ),
            Text(
              "No Offers Arround",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.adjust), label: "Offers"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Vouchers"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting")
        ],
        selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 18),
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 18),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
