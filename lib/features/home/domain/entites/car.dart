import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final List<String> images;
  final String id; // _id
  final String name;
  final String title;
  final String type;
  final int cost;

  const CarEntity({
    required this.images,
    required this.id,
    required this.name,
    required this.title,
    required this.type,
    required this.cost,
  });

  @override
  List<Object> get props => [images, id, name, title, type, cost];

  @override
  String toString() => 'CarEntity{images: $images, id: $id, name: $name, title: $title, type: $type, cost: $cost}';
}
