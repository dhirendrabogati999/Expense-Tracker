import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key, required this.onTabChange});

  final void Function(int index) onTabChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 200, 
                width: double.infinity,            
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  
                    
                ),
                child:const Column(  
                  crossAxisAlignment: CrossAxisAlignment.start,              
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$0.00",
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Income',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$0.00",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Expense',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$0.00",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      height: 130, 
                      // width: (MediaQuery.of(context).size.width - 60) / 2,            
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child:const Column(  
                        crossAxisAlignment: CrossAxisAlignment.start,              
                        children: [
                          Icon(Icons.category, color: Colors.blue,),
                          Spacer(),
                          Text(
                            'Top Category',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "No data",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      height: 130, 
                      // width: (MediaQuery.of(context).size.width - 60) / 2,            
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child:const Column(  
                        crossAxisAlignment: CrossAxisAlignment.start,              
                        children: [
                          Icon(Icons.account_balance_outlined, color: Colors.green,),
                          Spacer(),
                          Text(
                            "Monthly Goal",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                          ),
                          Text(
                            "0%",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.wallet_travel_outlined, size: 50, color: Colors.blueGrey[400],),
                  ),
                SizedBox(height: 20),
                const Text(
                  'No transactions yet',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                ),
                const Text(
                  'Start tracking your expenses by tapping the button below. Your financial journey begins here.',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, ),
                ),
                SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    onTabChange(0);                    // Navigate to HomePage
                  },
                  child: const Text('+  Add First Transaction', style: TextStyle(fontSize: 20, color: Colors.white),),
                )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
        
    );
  }
}