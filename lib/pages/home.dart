import 'package:flutter/material.dart';
import 'package:hw_8/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget body;
    if (currentIndex == 0) {
      body = const FirstPage();
    } else {
      body = const SecondPage();
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFb35647),
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          currentIndex = newIndex;

          setState(() {});
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: const Icon(Icons.settings),
            ),
            label: "Settings",
          ),
        ],
      ),
      body: body,
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final todoList = Todo.todoList();

  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFb35647),
        title: const Text("Today"),
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Jun 8 . Today . Wednesday",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Divider(
                  height: 20,
                ),
                for (Todo todo in todoList)
                  singleTask(
                    todo: todo,
                  ),
                // singleTask(
                //   title: 'Shop for groceries',
                //   color: const Color(0xFFd69248),
                //   subtitle: '',
                // ),
                // const Divider(
                //   indent: 65,
                //   height: 1,
                // ),
                // singleTask(
                //   title: 'Pack bag',
                //   color: const Color(0xFF5078d2),
                //   subtitle: 'Pack crayons and a soft drink',
                // ),
                // const Divider(
                //   height: 1,
                //   indent: 65,
                // ),
                // singleTask(
                //   title: 'Create project tag !! project',
                //   color: const Color(0xFFa2a2a2),
                //   subtitle: 'Create a project tag',
                // ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: "Add new task",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFb35647),
        child: const Icon(Icons.add),
        onPressed: () {
          if (_todoController.text.isNotEmpty) {
            _addTodoItem(_todoController.text);
          }
        },
      ),
    );
  }

  void _addTodoItem(String todo) {
    setState(() {
      todoList.add(
        Todo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: todo,
        ),
      );
    });
    _todoController.clear();
  }
}

class singleTask extends StatelessWidget {
  final Todo todo;

  // String title;
  // String subtitle;
  // Color color;

  const singleTask({
    required this.todo,
    // required this.subtitle,
    // required this.title,
    // required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.circle_outlined,
        color: Colors.red,
      ),
      title: Text(todo.todoText),
      subtitle: const Text(
        "Desc",
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //-------------------------------------------------------------
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.star_border_outlined,
                    color: Color(0xFFd39952),
                  ),
                  title: Text('Todoist Pro'),
                  subtitle: Text(
                    'Until Jul 8 2022',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ),
              // -------------------------------------------------------------
              const SizedBox(height: 20),
              // -------------------------------------------------------------
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    SingleSetting(title: 'Account', startIcon: Icons.account_circle_outlined),
                    const Divider(
                      indent: 65,
                      height: 1,
                    ),
                    SingleSetting(title: 'General', startIcon: Icons.settings),
                    const Divider(
                      indent: 65,
                      height: 1,
                    ),
                    SingleSetting(title: 'Theme', startIcon: Icons.palette_outlined),
                    const Divider(
                      indent: 65,
                      height: 1,
                    ),
                    SingleSetting(title: 'App Icon', startIcon: Icons.import_contacts),
                    const Divider(
                      indent: 65,
                      height: 1,
                    ),
                    SingleSetting(title: 'Productivity', startIcon: Icons.charging_station),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // -------------------------------------------------------------
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    SingleSetting(title: 'Reminders', startIcon: Icons.timelapse),
                    const Divider(
                      indent: 65,
                      height: 1,
                    ),
                    SingleSetting(title: 'Notifications', startIcon: Icons.notifications_active_outlined),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // ---------------------------------------------------------------
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    SingleSetting(title: 'Siri', startIcon: Icons.voice_chat),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // ---------------------------------------------------------------
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    SingleSetting(title: 'Help & Feedback', startIcon: Icons.help_outline_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleSetting extends StatelessWidget {
  String title;
  IconData startIcon;

  SingleSetting({
    required this.title,
    required this.startIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        startIcon,
        color: const Color(0xFFd4a097),
      ),
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
