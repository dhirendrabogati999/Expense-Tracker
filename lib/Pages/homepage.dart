import 'package:cash_flow/Pages/transactionpage.dart';
import 'package:cash_flow/Providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  // final List<String> days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  // final List <int> day = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
  HomePage({super.key});
  @override
  Widget build(BuildContext context){
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold( 
      backgroundColor: Colors.blueGrey[100],    
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 200, 
              width: double.infinity,            
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,              
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('\$', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),),
                      Text(
                         transactionProvider.transactions.isNotEmpty ? transactionProvider.transactions.map((t) => t.amount).reduce((a, b) => a + b).toStringAsFixed(2) : '0.00',
                          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Income',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text('\$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                Text(
                                  transactionProvider.totalIncome.toStringAsFixed(2),
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Expense',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text('\$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
                                Text(
                                  transactionProvider.totalExpense.toStringAsFixed(2),
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
            SizedBox(height: 40),
            const Row(
              children: [
                Text('This Month', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                Text('October', style: TextStyle(fontSize: 16, color: Colors.blue,fontWeight: FontWeight.bold),),
                SizedBox(width: 5),
                Icon( Icons.calendar_month, color: Colors.blue,size: 18,),
              ],
            ),
            SizedBox(height: 20),            
              Container(
                height: 60, // Fixed height for horizontal ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  
                  itemCount: 7, // Example: 7 days of the week
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10.0), // Changed to right for horizontal
                      padding: const EdgeInsets.all(10.0),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Column(
                        children: [
                          Text('mon', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          Text('1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    );
                  }),
              ),
              SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('See All', style: TextStyle(fontSize: 16, color: Colors.blue,fontWeight: FontWeight.bold),),
                 
                  
                ],
              ),
              SizedBox(height: 20),
              Consumer<TransactionProvider>(
                builder: (context, transactionProvider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView 
                    itemCount: transactionProvider.transactions.length, // Example: 5 transactions
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.all(20.0),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(transactionProvider.transactions[index].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              Row(
                                children: [
                                  Text('${transactionProvider.transactions[index].date.hour.toString().padLeft(2, '0')}:${transactionProvider.transactions[index].date.minute.toString().padLeft(2, '0')}', style: TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.bold),),
                                  SizedBox(width: 5),
                                  Text(transactionProvider.transactions[index].category, style: TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.bold),),
                                ],
                              ),         
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text('\$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: transactionProvider.transactions[index].category == 'income' ? Colors.green : Colors.red),),
                              Text(transactionProvider.transactions[index].amount.toStringAsFixed(2), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: transactionProvider.transactions[index].category == 'income' ? Colors.green : Colors.red),),
                            ],
                          ),
                        ],
                      ) ,
                    
                    );
                 });
                }
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionPage(),));
          },
          child: Icon(Icons.add, color: Colors.white,),
        ),
    );
  }
}