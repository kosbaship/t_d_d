import 'package:equatable/equatable.dart';

/// One: we create this class in our road of creation the repo contract
class NumbersModel with EquatableMixin {
  final String text;
  final int number;

  NumbersModel({
    this.text = "",
    this.number = 0,
  });

  @override
  List<Object> get props => [this.text, this.number];
}
