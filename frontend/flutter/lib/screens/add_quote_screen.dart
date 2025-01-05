
import 'package:flutter/material.dart';
import 'package:lower_case/services/quote_service.dart';

class AddQuoteScreen extends StatefulWidget {
  @override
  _AddQuoteScreenState createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {

  final _contentController = TextEditingController();
  int _selectedCategory = 1;
  int _selectedAuthor = 1;


  List<dynamic> categories = [];
  List<dynamic> authors = [];

  @override
  void initState() {
    super.initState();
    getCategories();
    getAuthors();
  }


  void getCategories() {

    QuoteService().getCategories().then((categoriesList) {
      setState(() {
        categories = categoriesList;
      });
    }).catchError((error) {
      print('Error fetching categories: $error');
    });
  }


  void getAuthors() {

    QuoteService().getAuthors().then((authorsList) {
      setState(() {
        authors = authorsList;
      });
    }).catchError((error) {
      print('Error fetching authors: $error');
    });
  }


  void _submitQuote() {
    if (_contentController.text.isEmpty) return;


    QuoteService().addQuote(
      _contentController.text,
      _selectedCategory,
      _selectedAuthor,
    ).then((_) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Quote added')));
      Navigator.pop(context);
    }).catchError((error) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add quote')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Quote')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Quote Content'),
            ),
            SizedBox(height: 16),


            DropdownButton<int>(
              value: _selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<int>(
                  value: category['id'],
                  child: Text(category['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: 16),


            DropdownButton<int>(
              value: _selectedAuthor,
              items: authors.map((author) {
                return DropdownMenuItem<int>(
                  value: author['id'],
                  child: Text(author['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedAuthor = value!;
                });
              },
            ),
            SizedBox(height: 16),


            ElevatedButton(
              onPressed: _submitQuote,
              child: Text('Submit Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
