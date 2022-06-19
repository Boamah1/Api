import 'package:flutter/material.dart';
import 'package:yes/api/api_calls.dart';
import 'package:yes/models/api_models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Who(),
    );
  }
}

class Who extends StatefulWidget {
  const Who({Key? key}) : super(key: key);

  @override
  State<Who> createState() => _WhoState();
}

class _WhoState extends State<Who> {
  late Future<Todos> data;
  @override
  void initState() {
    // TODO: implement initState
    TodoApi todoApi = TodoApi();
    data = todoApi.getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: data,
        builder: (context, AsyncSnapshot<Todos> snapshots) {
          if (snapshots.hasData) {
            return ListView.builder(
              itemCount: snapshots.data!.todos.length,
              itemBuilder: (context, index) {
                var newData = snapshots.data!.todos[index];
                return Column(
                  children: [
                    Text(
                      newData.title.toString(),
                    ),
                    Text(
                      newData.completed.toString(),
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ],
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
