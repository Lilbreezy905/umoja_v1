

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Suggestion {
  String suggestionUid;
  String suggestionContent;
  Suggestion({
    required this.suggestionUid,
    required this.suggestionContent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'suggestionUid': suggestionUid,
      'suggestionContent': suggestionContent,
    };
  }

  factory Suggestion.fromMap(Map<String, dynamic> map) {
    return Suggestion(
      suggestionUid: map['suggestionUid'] as String,
      suggestionContent: map['suggestionContent'] as String,
    );
  }

}
