import 'package:flutter/material.dart';

import 'horizontal_numberpicker_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // NumberFormatt _numberFormat = NumberFormat(',000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 40),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            StepProgress(
              initStep: 1,
              totalStep: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'How old are you?',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 89, 96, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            HorizontalNumberPickerWrapper(
              initialValue: 20, // 初始化刻度
              minValue: 0,
              maxValue: 100,
              step: 1,
              unit: '',
              widgetWidth: MediaQuery.of(context).size.width.round() - 30,
              subGridCountPerGrid: 10,
              subGridWidth: 8, // 每个小格子的间距
              scaleTextColor: Colors.black, // 下方文字颜色
              titleTextColor: Color.fromRGBO(80, 89, 96, 1),
              indicatorColor: Color.fromRGBO(92, 205, 216, 1), // 指示器颜色
              onSelectedChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 200),
            Container(
              width: 260,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Color.fromRGBO(92, 205, 216, 1),
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// 进度
class StepProgress extends StatefulWidget {
  final int totalStep;
  final int initStep;

  const StepProgress({Key key, this.totalStep = 0, this.initStep = 0})
      : super(key: key);

  @override
  _StepProgressState createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  @override
  Widget build(BuildContext context) {
    return _topProgress();
  }

  Widget _topProgress() {
    final int rightExpand = widget.totalStep - widget.initStep;

    return Row(
      children: [
        Container(
          width: 45,
          height: 50,
          alignment: Alignment.centerLeft,
          child: Icon(Icons.arrow_back),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                    color: Color(0xffeeeeee),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Row(
                children: [
                  Expanded(
                    flex: widget.initStep,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(92, 205, 216, 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Expanded(
                    flex: rightExpand,
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.centerRight,
          child: Text(
            '1/8',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
