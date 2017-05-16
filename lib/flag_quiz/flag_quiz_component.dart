import 'package:angular2/core.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'flag-quiz',
  styleUrls: const ['flag_quiz_component.css'],
  templateUrl: 'flag_quiz_component.html',
  directives: const [materialDirectives]
)
class FlagQuizComponent {
  String guess = "";
  String flagUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/300px-Flag_of_the_United_States.svg.png";
  bool isButtonEnabled = true;

  void submitGuess() {
    guess = guess + "!";
  }

  void updateGuess(String s) {
    guess = s;
  }
}