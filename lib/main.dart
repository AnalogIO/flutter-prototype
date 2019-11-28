import 'package:flutter/material.dart';
import 'pages/login_page.dart';

const OWNED_TICKETS = [{'espresso': 2}];
const ALL_TICKETS = {
  'filter' : {
    'name': 'Filter Coffee',
    'desc': 'Used for filter coffee brewed with fresh ground coffee',
    'price': 80
  },
  'espresso': {
    'name': 'Espresso Based',
    'desc': 'Used for specialities like espresso, cappuccino, caffe latte, cortado, americano and chai latte.',
    'price': 150
  },
  'tea' : {
    'name': 'Tea',
    'desc': 'Used for our large collection of organic tea',
    'price': 50
  },
  'syrup' : {
    'name': 'Syrup',
    'desc': 'Used for syrup',
    'price': 10
  }
};

void main() => runApp(App());

/// This Widget is the main application widget.
class App extends StatelessWidget {
  static const String _title = 'Café Analog';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Color(0xff362619),
        primaryColorBrightness: Brightness.dark,
        primaryTextTheme: TextTheme(title: TextStyle(color: Color(0xffFAFAFA))),
        primaryIconTheme: IconThemeData(color: Color(0xffE5E2D7)),
        canvasColor: Color(0xffE5E2D7),
      ),
      color: Colors.black,
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => LoginPage(),
        '/home':  (BuildContext context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // TODO: These two lists can be optimized
  static const List<String> _tabNames = <String>[
    'Tickets',
    'Receipts',
    'Statistics',
    'Settings',
    'About'
  ];
  static final List<Widget> _widgetOptions = <Widget>[
    PageTickets(),
    PageReceipts(),
    PageStats(),
    PageSettings(),
    PageAbout(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onMenuTapped() {
    // handle menu tap
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabNames[_selectedIndex],
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)
        ),
        centerTitle: false,
        actions: <Widget>[IconButton(icon: Icon(Icons.more_vert), onPressed: _onMenuTapped)],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Tickets'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('Receipts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('About'),
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xff362619),
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color(0xffE5E2D7),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PageTickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Text(
    //   'Tickets'
    // );
    return TicketCard();
  }
}

class PageReceipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Receipts'
    );
  }
}

class PageStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Stats'
    );
  }
}

class PageSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Settings'
    );
  }
}

class PageAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      ALL_TICKETS['filter']['desc']
    );
  }
}

class TicketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('Card')
    );
  }
}
