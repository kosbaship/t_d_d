import 'package:equatable/equatable.dart';

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
