import 'package:scoped_model/scoped_model.dart';

class SelectionsModel extends Model {
  int _selectedAnimation = 0;

  int get selectedAnimation => _selectedAnimation;

  set selectedAnimation(int selection) {
    _selectedAnimation = selection;

    // The listener is in the AnimationDisplaySwitcher (in the logic folder)
    notifyListeners();
  }
}