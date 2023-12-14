// Create model classes to represent your data
class Quiz {
  final String idKuis;
  final String question;
  final List<QuizOption> data;

  Quiz({required this.idKuis, required this.question, required this.data});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      idKuis: json['idKuis'],
      question: json['question'],
      data: (json['data'] as List)
          .map((option) => QuizOption.fromJson(option))
          .toList(),
    );
  }
}

class QuizOption {
  final String id;
  final String questionId;
  final String optionText;
  final bool status;

  QuizOption({
    required this.id,
    required this.questionId,
    required this.optionText,
    required this.status,
  });

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      id: json['id'],
      questionId: json['question_id'],
      optionText: json['option_text'],
      status: json['status'] == 'true',
    );
  }
}


// import 'package:first_app/model/question_model.dart';

// List<QuestionModel> question = [
//   QuestionModel(
//     "How Many Whiskers does the average cat have on each side of its face ?",
//     {
//       "1": false,
//       "3": false,
//       "12": true,
//       "5,007": false,
//     },
//   ),
//   QuestionModel("When does a cat purr ?", {
//     "When it cares for its kittens": false,
//     "When it needs confort": false,
//     "When it feels content": false,
//     "All of the above": true,
//   }),
//   QuestionModel("What is the averge nulber of kittens in a litter ?", {
//     "1 to 2": false,
//     "3 to 5": true,
//     "8 to 10": false,
//     "12 to 14": false,
//   }),
//   QuestionModel("How many moons does Mars have ?", {
//     "1": false,
//     "2": false,
//     "4": true,
//     "8": false,
//   }),
//   QuestionModel("What is Mars's nickname ?", {
//     "The red planet": true,
//     "The dusty planet": false,
//     "The hot planet": false,
//     "The smelly planet": false,
//   }),
//   QuestionModel("About How long would it take to travel to Mars ?", {
//     "Three days": false,
//     "A month": false,
//     "Eight months": true,
//     "Two years": false,
//   }),
//   QuestionModel(
//       "Mars is Named after the Roman god Mars. What is he the god of ?", {
//     "Fire": false,
//     "Love": false,
//     "Agriculture": false,
//     "War": true,
//   }),
//   QuestionModel("Mars Is the ___ planet from the sun ?", {
//     "Secon": false,
//     "Third": false,
//     "Fourth": true,
//     "Sixth": false,
//   }),
//   QuestionModel(
//       "Where did Orville and Wilbur Wright build their first flying airplane ?",
//       {
//         "Paris, France": false,
//         "Boston, Massachusetts": false,
//         "Kitty Hawk, North Carolina": true,
//         "Tokyou, Japan": false,
//       }),
//   QuestionModel(
//       "The First astronuts to travel to space came from which country ?", {
//     "United States": false,
//     "Soviet Union (now Russia)": true,
//     "China": false,
//     "Rocketonia": false,
//   }),
// ];
