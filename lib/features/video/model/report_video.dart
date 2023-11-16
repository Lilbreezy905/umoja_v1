

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReportVideo {
  final String whoPostVideoName;
  final String whoPostVideoUid;
  final String whoReport;
  final String reportVideoUrl;
  final String reportVideoId;
  final String reportDescription;
  ReportVideo({
    required this.whoPostVideoName,
    required this.whoPostVideoUid,
    required this.whoReport,
    required this.reportVideoUrl,
    required this.reportVideoId,
    required this.reportDescription,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'whoPostVideoName': whoPostVideoName,
      'whoPostVideoUid': whoPostVideoUid,
      'whoReport': whoReport,
      'reportVideoUrl': reportVideoUrl,
      'videoUrl': reportVideoId,
      'reportDescription': reportDescription,
    };
  }

  factory ReportVideo.fromMap(Map<String, dynamic> map) {
    return ReportVideo(
      whoPostVideoName: map['whoPostVideoName'] as String,
      whoPostVideoUid: map['whoPostVideoUid'] as String,
      whoReport: map['whoReport'] as String,
      reportVideoUrl: map['reportVideoUrl'] as String,
      reportVideoId: map['reportVideoId'] as String,
      reportDescription: map['reportDescription'] as String,
    );
  }

  }
