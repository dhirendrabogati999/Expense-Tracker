import 'package:cash_flow/Models/cash_models.dart';
import 'package:cash_flow/Pages/analyticspage.dart';
import 'package:cash_flow/Pages/homepage.dart';
import 'package:cash_flow/Providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

Hive.registerAdapter(cashModelAdapter()); // IMPORTANT

  await Hive.openBox<cashModel>('cashBox');

  runApp(
    MultiProvider(providers: 
    [
      ChangeNotifierProvider(create: (_) => TransactionProvider()),

    ],
    child: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyIntroPage(),
    );
  }
}
class MyIntroPage extends StatefulWidget{
  @override
  _MyIntroPageState createState() => _MyIntroPageState();
}
class _MyIntroPageState extends State<MyIntroPage>{
  int _currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
       HomePage(),
      AnalyticsPage(onTabChange: onItemTapped),    
    ];
  }
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        title: const Row(     
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.account_circle, color: Colors.white,),
            ),
            SizedBox(width: 10),
            Text('Ledger', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue),),
            Spacer(),
            Icon( Icons.notifications, color: Colors.blue,size: 24,),
          ],
        ),
      ),
        body: _pages[_currentIndex],
        
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Analytics',
            ),
          ],
        ),
        
      ),
    );
  }
}