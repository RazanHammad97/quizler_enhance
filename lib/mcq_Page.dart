import 'package:flutter/material.dart';
import 'package:quizler_enhance/mcq_quizbrain.dart';

class MCQPage extends StatefulWidget {
  const MCQPage({super.key, required this.title});

  final String title;


  @override
  State<MCQPage> createState() =>  MCQPageState();
}

class  MCQPageState extends State<MCQPage> {
  MCQuizBrain quizBrain = MCQuizBrain();
  List<Widget> scoreKeeper=[];
  int? groupValue;
  double progressBarValue =0;
  @override
  Widget build(BuildContext context) {

    void checkAnswer(int userAnswer){
      //_groupValue=null;
      int correctAnswer = quizBrain.getQuestionAnswer();
      //print(userAnswer);
      //print(correctAnswer);
      if(quizBrain.isFinished()){
        setState(() {
          quizBrain.reset();
          scoreKeeper=[];
          progressBarValue=0;
        });

      }

      else{
        setState(() {

          quizBrain.nextQuestion();
            progressBarValue+=0.2;
          if(userAnswer==correctAnswer){
            print('true');
            scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
          }
          else{
            print('false');
            scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
          }

        });

      }

      groupValue = null;

    }
    //quizBrain.nextQuestion();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        SafeArea(
          child:
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pinkAccent,
                        Colors.yellowAccent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  ),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              LinearProgressIndicator(
                                value: progressBarValue,
                                color: Colors.greenAccent, //<-- SEE HERE
                                backgroundColor: Colors.grey, //<-- SEE HERE
                              ),
                            ],
                          ),
                          Expanded(

                              child: Center(child: Text(quizBrain.getQuestionText(),style: TextStyle(fontSize: 25),))
                          ),

                          Expanded(child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ListTile(
                                title:  Text(quizBrain.getChoices()[0]),
                                leading: Radio<int>(
                                  value: 0,
                                  activeColor: Colors.black,
                                  focusColor: Colors.pink,
                                  hoverColor: Colors.red,
                                  groupValue: groupValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value;
                                      checkAnswer(groupValue!);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title:  Text(quizBrain.getChoices()[1]),
                                leading: Radio<int>(

                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value;
                                      checkAnswer(groupValue!);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title:  Text(quizBrain.getChoices()[2]),
                                leading: Radio<int>(
                                  value: 2,
                                  groupValue: groupValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value;
                                      checkAnswer(groupValue!);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title:  Text(quizBrain.getChoices()[3]),
                                leading: Radio<int>(
                                  value: 3,
                                  groupValue: groupValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value;
                                      checkAnswer(groupValue!);
                                    });
                                  },
                                ),
                              ),
                            ],

                          ),
                          ),

                            Row(
                              children: scoreKeeper,
                            ),



                          Row(

                            children: [
                              Expanded(child: ElevatedButton(onPressed: (){
                                setState(() {
                                  quizBrain.lastQuestion();
                                });
                                }, child: Text('Back'),style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green
                              ),)),
                              SizedBox(height: 150,),
                              Expanded(child: ElevatedButton(onPressed: (){
                                setState(() {
                                  quizBrain.nextQuestion();
                                });

                              }, child: Text('Next'),style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red
                              ),)),
                            ],
                          ),
                        ],

                      ),

              ),




        ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}


//problems :

//Selected radio not colored with blue.
// //Last question result icon nd progress bar not appeared.
// //check back and next buttons.

// //add timer for each question. // may be it can be added to the question class

