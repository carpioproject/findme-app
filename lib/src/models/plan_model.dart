import 'package:findme/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Plan {
  final String name;
  final String imageUrl;
  final User user;
  final Votes votes;
  final DocumentReference reference;

  Plan({this.name, this.imageUrl, this.user, this.votes, this.reference});

  Plan.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        name = map['name'],
        user = map['user'],
        votes = map['votes'],
        imageUrl = map['imageUrl'];

  Plan.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}

class Votes {
  List<User> positive;
  List<User> negative;

  Votes({this.positive, this.negative});
}
