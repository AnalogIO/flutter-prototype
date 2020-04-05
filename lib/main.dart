import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';
import 'package:analog_app/utils/tickets_state.dart';

import 'pages/login_page.dart';
import 'pages/tickets_page.dart';

void main() => runApp(
  MultiProvider(
    child: App(),
    providers: [
      ChangeNotifierProvider(create: (context) => LoginState()),
      ChangeNotifierProvider(create: (context) => TicketsState())
    ]
  )
);

/// This Widget is the main application widget.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
      title: 'Café Analog',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: AppColors.primary,
        primaryColorBrightness: Brightness.dark,
        primaryTextTheme: TextTheme(title: TextStyle(color: AppColors.white)),
        primaryIconTheme: IconThemeData(color: AppColors.background),
        canvasColor: AppColors.background,
      ),
      color: AppColors.primary,
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
    TicketsPage(),
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
            title: Text('Tickets', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('Receipts', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('Stats', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('About', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.highlight,
        unselectedItemColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PageReceipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Reciepts'
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
