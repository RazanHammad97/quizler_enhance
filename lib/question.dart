class MCQuestion{

  String questionText;
  MCQAnswer questionAnswer;
  List<String> choices;

  MCQuestion(this.questionText,this.questionAnswer,this.choices);



}

enum MCQAnswer  {A,B,C,D}