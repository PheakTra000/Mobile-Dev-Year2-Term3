import 'package:flutter/material.dart';
import 'package:flutter_project/W10/loginPage/data/repositories/scores_repository.dart';
import 'package:flutter_project/W10/loginPage/data/services/auth_services.dart';
import 'package:flutter_project/W10/loginPage/model/score.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key, required this.logout});
  final Future<void> Function() logout;
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String token = AuthServices.instance.session!.token;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadScore();
  }

  List<Score> scores = [];
  Future<void> loadScore() async {
    final result = await ScoresRepository.instance.getScore(token);
    setState(() {
      scores = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${AuthServices.instance.session?.user.name}'),
        actions: [
          IconButton(onPressed: widget.logout, icon: Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text('Your Score'),

            Expanded(
              child: ListView.builder(
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(scores[index].title),
                    trailing: Text("${scores[index].value}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
