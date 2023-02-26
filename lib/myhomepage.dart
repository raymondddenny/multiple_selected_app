import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedPos = '';
  List<String> selectedPosList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(200),
          constrained: false,
          minScale: 1,
          maxScale: 1,
          child: Column(
            children: List.generate(10, (i) {
              return Row(
                children: List.generate(10, (j) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedPos = '$i:$j';
                        if (selectedPosList.contains(selectedPos)) {
                          selectedPosList.remove(selectedPos);
                        } else {
                          selectedPosList.add(selectedPos);
                        }
                      });
                      debugPrint('selectedPos: $selectedPos');
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: selectedPosList.contains('$i:$j') ? Colors.blue : Colors.transparent,
                      ),
                      child: Text('$i:$j'),
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
