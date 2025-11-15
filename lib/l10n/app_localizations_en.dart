// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String goodMorning(Object name) {
    return 'Good Morning, $name';
  }

  @override
  String get twoDaysStreak => '2 days streak';

  @override
  String get featuredWorkouts => 'Featured Workouts';

  @override
  String get meditativeMornings => 'Meditative Mornings';

  @override
  String get completeAssessment => 'Complete Assessment';

  @override
  String get seeAll => 'See All';

  @override
  String get workoutsForYou => 'Workouts For You';

  @override
  String get helpAssist => 'Help us assist you better';

  @override
  String get assistanceBody => 'Answer a few questions to get best from the app\\nand achieve your goals faster.';

  @override
  String get home => 'Home';

  @override
  String get strength => 'Strength';

  @override
  String get cardio => 'Cardio';

  @override
  String get yoga => 'Yoga';

  @override
  String get walking => 'Walking';

  @override
  String get running => 'Running';

  @override
  String get swimming => 'Swimming';
}
