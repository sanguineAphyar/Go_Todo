import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CreatTodoView extends StatefulWidget {
  @override
  _CreatTodoViewState createState() => _CreatTodoViewState();
}

class _CreatTodoViewState extends State<CreatTodoView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Create a Todo'),
          backgroundColor: Colors.white60,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                    labelText: 'Title', hintText: 'please enter a title '),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a title";
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'plesae describe your task',
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a description";
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)))
                    .then((value) {
                  setState(() {
                    _dateController.text = DateFormat.yMMMd().format(value!);
                  });
                }),
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Please enter a date',
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 10),
              TextFormField(
                onTap: () => showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                    .then((value) => setState(() {
                          _timeController.text = (value!.format(context));
                        })),
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Please enter a date',
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select a date';
                  } else if (value ==
                      DateFormat.yMMMd().format(DateTime.now())) {}
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Create',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
