import 'dart:async';
import 'package:FlagQuiz/flag_quiz/flag_quiz_service.dart';
import 'package:angular2/core.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'flag-quiz',
  styleUrls: const ['flag_quiz_component.css'],
  templateUrl: 'flag_quiz_component.html',
  directives: const [materialDirectives],
  providers: const [CountryService]
)
class FlagQuizComponent implements OnInit {
  final CountryService _countryService;
  String guess = "";
  String flagUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/300px-Flag_of_the_United_States.svg.png";
  String actualCountry = "";
  bool isButtonEnabled = true;

  FlagQuizComponent(this._countryService);

  @override
  Future ngOnInit() async {
    try {
      flagUrl = 'https://flagpedia.net/data/flags/normal/${_countryService.getRandomCountryCode().toLowerCase()}.png';
      print('Test');
    } catch (err) {
      actualCountry = "";
      print('Error getting countries: $err');
    }
  }

  void submitGuess() {
    guess = guess + "!";
    flagUrl = 'http://flags.fmcdn.net/data/flags/w580/${_countryService.getRandomCountryCode().toLowerCase()}.png';
    print(flagUrl);
  }

  void updateGuess(String s) {
    guess = s;
  }
}