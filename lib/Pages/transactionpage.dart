import 'package:cash_flow/Models/cash_models.dart';
import 'package:cash_flow/Providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatefulWidget{
  @override
  State<TransactionPage> createState() => _TransactionPageState();
  
  void onTabChange(int i) {}
}

class _TransactionPageState extends State<TransactionPage> {

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  bool isExpense = true;
  String? selectedCategory;
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          title: const Row(
            children: [
              Text('Add Transaction'),
              Spacer(),
              CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.account_circle, color: Colors.white,),
            ),
            ],
          ),          
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('ENTER AMOUNT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('\$', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(width: 100),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _amountController,  
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0.00',hintStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ), 
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isExpense = true);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isExpense ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:isExpense ? Center(child: Text("Expense",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blue),))
                           : Center(child: Text("Expense",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isExpense = false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: !isExpense ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: !isExpense ? Center(child: Text("Income",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blue),)) 
                          : Center(child: Text("Income",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text('TITLE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 50, 
                width: double.infinity,            
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),                 
                ),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'What is this transaction for?',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DATE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        height: 50, 
                        width: 170,            
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),                 
                        ),
                        child:const Center(
                          child:  Row(children: [
                            Icon(Icons.calendar_today, size: 16, color: Colors.grey,),
                            SizedBox(width: 10),
                            Text('Today ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ],),
                        )
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CATEGORY', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        height: 50, 
                        width: 170,            
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),                 
                        ),
                        child:const Center(
                          child:  Row(children: [
                            Icon(Icons.category, size: 16, color: Colors.grey,),
                            SizedBox(width: 10),
                            Text('Dining Out ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ],),
                        )
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('QUICK CATEGORIES', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() => selectedCategory = 'FOOD');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'FOOD' ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: selectedCategory == 'FOOD' ? Border.all(color: Colors.blue, width: 2) : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.food_bank, size: 40, color: selectedCategory == 'FOOD' ? Colors.white : Colors.grey,),
                          Text('FOOD', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: selectedCategory == 'FOOD' ? Colors.white : Colors.black),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() => selectedCategory = 'SHOP');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'SHOP' ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: selectedCategory == 'SHOP' ? Border.all(color: Colors.blue, width: 2) : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shop_2, size: 40, color: selectedCategory == 'SHOP' ? Colors.white : Colors.grey,),
                          Text('SHOP', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: selectedCategory == 'SHOP' ? Colors.white : Colors.black),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() => selectedCategory = 'TRAVEL');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'TRAVEL' ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: selectedCategory == 'TRAVEL' ? Border.all(color: Colors.blue, width: 2) : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.card_travel_outlined, size: 40, color: selectedCategory == 'TRAVEL' ? Colors.white : Colors.grey,),
                          Text('TRAVEL', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: selectedCategory == 'TRAVEL' ? Colors.white : Colors.black),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() => selectedCategory = 'BILLS');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'BILLS' ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: selectedCategory == 'BILLS' ? Border.all(color: Colors.blue, width: 2) : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_atm, size: 40, color: selectedCategory == 'BILLS' ? Colors.white : Colors.grey,),
                          Text('BILLS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: selectedCategory == 'BILLS' ? Colors.white : Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Consumer<TransactionProvider>(
                builder: (context, transactionProvider, child) {
                  return InkWell(
                    onTap: () {
                      final title = _titleController.text.trim();
                      final amount = double.tryParse(_amountController.text) ?? 0.0;

                      if(title.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text('Please enter a title for the transaction.')),
                        );
                        return;
                      }

                      if(amount <= 0.0){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter a valid amount greater than zero.')),
                        );
                        return;
                      }
                      cashModel newTransaction = cashModel(
                        title: title,
                        amount: amount,
                        date: DateTime.now(),
                        category: isExpense ? 'expense' : 'income',
                        specificCategory: selectedCategory,
                      );
                    transactionProvider.addTransaction(newTransaction);
                     widget.onTabChange(0); // Navigate back to HomePage
                     Navigator.pop(context); // Close the TransactionPage
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Save Transaction',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}