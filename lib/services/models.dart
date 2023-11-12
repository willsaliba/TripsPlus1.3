import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Trip {
  final String groupName;
  final String startDate;
  final String endDate;
  final List<String> groupMembers;
  final String theColour;

  // Constructor
  Trip({
    required this.groupName,
    required this.startDate,
    required this.endDate,
    required this.groupMembers,
    required this.theColour,
  });
}

@JsonSerializable()
class Member {
  final String name;
  double debt; //green = + they owe you //red = - you owe them
  //photo?

  // Constructor
  Member({
    required this.name,
    required this.debt,
  });
}