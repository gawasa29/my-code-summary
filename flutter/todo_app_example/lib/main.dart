import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'command.dart';
import 'firebase_options.dart';
import 'query.dart';
import 'todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
//flutterfire_cliで追加されたfirebase_options.dartのためにいる。
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _taskNameController = TextEditingController();

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        final todoList = ref.watch(todoListQueryProvider);
        final todoCommand = ref.read(todoCommandProvider);

        // 新しいTodoを追加する、プライベートメソッドを定義
        void addTodo() {
          if (_taskNameController.text != "") {
            final newTodo = Todo(
              id: Random().nextDouble().toString(),
              description: _taskNameController.text,
            );
            todoCommand.add(newTodo);
          } else {
            print('値を入れてください');
          }

          _taskNameController.clear();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('TODO example'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _taskNameController,
                  decoration: const InputDecoration(
                    labelText: 'Task Name',
                  ),
                ),
              ),
              todoList.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text('Error $err'),
                data: (data) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.todo.length,
                      itemBuilder: (context, index) {
                        final todo = data.todo[index];
                        return ListTile(
                          // TodoのタイトルをTextで表示
                          title: Text(todo.description),
                          leading: Icon(
                            todo.completed
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          trailing: TextButton(
                            onPressed: () => todoCommand.remove(todo.id),
                            child: const Text('Delete'),
                          ),
                          // タップでTODOの完了状態を切り替える
                          onTap: () => todoCommand.toggle(todo.id),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: addTodo,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
