import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';

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

void main() => runApp(
  MultiProvider(
    child: App(),
    providers: [
      ChangeNotifierProvider(create: (context) => LoginState())
    ]
  )
);

/// This Widget is the main application widget.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Analog',
      theme: ThemeData(
        primaryColor: AppColors.coffee,
        primaryColorBrightness: Brightness.dark,
        primaryTextTheme: TextTheme(title: TextStyle(color: AppColors.white)),
        primaryIconTheme: IconThemeData(color: AppColors.cream),
        canvasColor: AppColors.cream,
      ),
      color: AppColors.coffee,
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
        backgroundColor: AppColors.coffee,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.cream,
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
