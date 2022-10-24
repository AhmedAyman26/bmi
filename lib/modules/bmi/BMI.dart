import 'dart:math';
import 'package:bmi/modules/bmi_result/BMiResultScreen.dart';
import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  bool isMale=true;
  double height=120;
  int age=18;
  int weight=50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState((
                              ) {
                            isMale=true;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 80,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color : isMale? Colors.greenAccent:Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 80,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale? Colors.grey[400]:Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Height',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children:
                        [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Cm',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Slider
                        (
                        value: height,
                        max: 220,
                        min: 80,
                        onChanged:(value){
                          setState(() {
                            height=value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(
                            'Age',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: 'age-',
                                child: Icon(
                                  Icons.remove,
                                ),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'age+',
                                child: Icon(
                                  Icons.add,
                                ),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              FloatingActionButton(

                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'weight-',
                                child: Icon(
                                  Icons.remove,
                                ),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'weight+',
                                child: Icon(
                                  Icons.add,
                                ),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.greenAccent,
            child: MaterialButton(
              onPressed: (){
                double result=weight / pow(height / 100,2);
                Navigator.push(
                  context,
                  MaterialPageRoute
                    (
                    builder: (context)=>BmiResultScreen(
                      result:result.round(),
                      age:age,
                      isMale:isMale,
                    ),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
