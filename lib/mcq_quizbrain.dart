import 'package:quizler_enhance/question.dart';

class MCQuizBrain{
     int _qNum=0;
  final List<MCQuestion> _questions = [
    MCQuestion(
      'Which of these EU countries does not use the euro as its currency?',
      MCQAnswer.D,
      ['Poland', 'Denmark', 'Sweden', 'All of the above'],
    ),
    MCQuestion(
      'What element does the chemical symbol Au stand for?',
      MCQAnswer.D,
      ['Silver', 'Magnesium', 'Salt', 'Gold'],
    ),
    MCQuestion(
      'On average, how many seeds are located on the outside of a strawberry?',
      MCQAnswer.B,
      ['100', '200', '400', '500'],
    ),
    MCQuestion(
      'What is the highest-grossing holiday movie of all time?',
      MCQAnswer.D,
      ['Elf', 'Die Hard', ' It’s A Wonderful Life', 'Home Alone'],
    ),
    MCQuestion(
      'What is the only food that cannot go bad?',
      MCQAnswer.C,
      ['Dark chocolate', 'Peanut butter', 'Honey', 'Canned tuna'],
    ),
  ];

  String getQuestionText(){

    return _questions[_qNum].questionText;
  }

  int getQuestionAnswer(){
   // print(_questions[_qNum].questionAnswer.index);
    return _questions[_qNum].questionAnswer.index;
  }

  List<String> getChoices(){
    return _questions[_qNum].choices;
  }

  void nextQuestion(){

  if(_qNum<_questions.length-1){ // in case < 4 apply the condition body
    //print(_qNum);
    _qNum++;
  }
   // print(_qNum);
  }


  bool isFinished()
  {
    if(_qNum>=_questions.length-1){
      return true;
    }
    else{
      return false;
    }
  }

  void reset(){
    _qNum=0;

  }

  String  lastQuestion(){
    if(_qNum>0)
      _qNum--;

    return _questions[_qNum].questionText;
  }


}