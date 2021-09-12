import 'package:equatable/equatable.dart';

/// One: we create this class in our road of creation the repo contract
abstract class Failure with EquatableMixin {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  Failure([List properties = const <dynamic>[]]);
}
