import 'package:flutter/material.dart';
import 'package:work_with_kotlin/repository/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _result = PlatformRepository();
  String colorResult = '0xff123456';

  Future<String> changeColor(String color) async {
    colorResult = await _result.changeColor(color);
    return colorResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey),
      backgroundColor: Color(int.parse(colorResult)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.yellow,
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    changeColor('0xff987654');
                    setState(() {});
                  },
                  child: const Text('flutter button'),
                ),
                ElevatedButton(
                  onPressed: () {
                    changeColor('0xff456789');
                    setState(() {});
                  },
                  child: const Text('flutter button'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
