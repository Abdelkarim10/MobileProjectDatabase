import 'package:flutter/material.dart';
import 'package:lower_case/services/quote_service.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<dynamic> quotes = [];

  @override
  void initState() {
    super.initState();
    getQuotes();
  }


  void getQuotes() {
    QuoteService().getQuotes().then((quotesList) {
      setState(() {
        quotes = quotesList;
      });
    }).catchError((error) {
      print('Error fetching quotes: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes')),
      body: quotes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                quotes[index]['content'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('By: ${quotes[index]['author']['name']}'),
                  Text('Category: ${quotes[index]['category']['name']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
