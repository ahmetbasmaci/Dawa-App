import '../helper/enums.dart';

class QuestionSection {
  String sectionName;
  SectionType sectionType;
  List<Topics> topics;

  QuestionSection({required this.sectionName, required this.sectionType, required this.topics});

  factory QuestionSection.fromJson(Map<String, dynamic> json) {
    List<Topics> tempTopics = [];
    if (json['topics'] != null) {
      tempTopics = [];
      json['topics'].forEach((v) {
        tempTopics.add(Topics.fromJson(v));
      });
    }
    return QuestionSection(
      sectionName: json['sectionName'],
      sectionType: SectionType.values.firstWhere(
          (element) => element.name.toLowerCase().trim() == (json['sectionType'].toLowerCase().trim() ?? SectionType.values.first.name)),
      topics: tempTopics,
    );
  }
}

class Topics {
  String header;
  List<NestedTopics> nestedTopics;

  Topics({required this.header, required this.nestedTopics});

  factory Topics.fromJson(Map<String, dynamic> json) {
    List<NestedTopics> tempNestedTopics = [];
    if (json['nestedTopics'] != null) {
      json['nestedTopics'].forEach((v) {
        tempNestedTopics.add(NestedTopics.fromJson(v));
      });
    }
    return Topics(
      header: json['header'],
      nestedTopics: tempNestedTopics,
    );
  }
}

class NestedTopics {
  String title = "";
  String body = "";

  NestedTopics({required this.title, required this.body});

  factory NestedTopics.fromJson(Map<String, dynamic> json) {
    return NestedTopics(
      title: json['title'],
      body: json['body'],
    );
  }
}
