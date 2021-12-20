import 'package:flutter/material.dart';
import 'package:todo_app/TodoDetailView.dart';
import 'package:todo_app/creat_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: SafeArea(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: (context),
                    builder: (context) {
                      return ListView(
                        children: const [
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                          CompletedTodoTile(),
                        ],
                      );
                    });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text('completed'),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                    Text('24'),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CreatTodoView();
              }));
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const CircleAvatar(
                foregroundImage: AssetImage("assets/vida.jpg"),
              ),
            ),
            title: const Text(
              "My tasks",
              style: TextStyle(color: Colors.black),
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          body: ListView(children: [
            TodoTile(
                title: "plan a trip to Ghana",
                subtitle: "Take the entire class to Ghana by Nkwatan road"),
            TodoTile(
                title: 'Plan a trip to America',
                subtitle: 'Take the entire class to Ghana by Nkwatan road'),
            TodoTile(
                title: 'Plan a trip to Canada',
                subtitle: 'Take the entire class to Ghana by Nkwatan road'),
          ])),
    );
  }
}

class TodoTile extends StatelessWidget {
  const TodoTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailView(title: title, subtitle: subtitle);
        }));
      },
      child: Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.check_circle_outlined),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              maxLines: 3,
              overflow: TextOverflow.fade,
            ),
            trailing: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.notifications),
                label: Text('Yesterday')),
          )),
    );
  }
}

class CompletedTodoTile extends StatelessWidget {
  const CompletedTodoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const DetailView(
              title: 'Trip to Tamale', subtitle: 'This is a completed trip');
        }));
      },
      child: Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.check_circle_outlined),
            title: const Text(
              'Trip to Tamale',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'This is a completed trip',
              maxLines: 3,
              overflow: TextOverflow.fade,
            ),
            trailing: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.notifications),
                label: Text('Yesterday')),
          )),
    );
  }
}
