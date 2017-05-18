import 'dart:async';
import 'dart:html';
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
  String status = "guess";
  bool isButtonEnabled = true;


  FlagQuizComponent(this._countryService);

  @override
  Future ngOnInit() async {
    try {
      newCountry();
      print('Test');
    } catch (err) {
      actualCountry = "";
      print('Error getting countries: $err');
    }
  }

  Future submitGuess() async {
    if (_countryService.checkCorrect(actualCountry.toUpperCase(), guess)) {
      status = "correct";
      querySelector('#status').animate([{"color": '#1976D2'}, {"color": '#388E3C'}], 1000);
      await querySelector('#status').animate([{"color": '#388E3C'}, {"color": '#1976D2'}], 1000);
      status = "guess";

    } else {
      status = "nope";
      querySelector('#status').animate([{"color": '#1976D2'}, {"color": '#D32F2F'}], 1000);
      await querySelector('#status').animate([{"color": '#D32F2F'}, {"color": '#1976D2'}], 1000);
      status = "guess";


    }

    newCountry();
  }

  void updateGuess(String s) {
    guess = s;
  }

  void newCountry() {
    actualCountry = _countryService.getRandomCountryCode().toLowerCase();
    flagUrl = 'http://flags.fmcdn.net/data/flags/w580/$actualCountry.png';
  }
}