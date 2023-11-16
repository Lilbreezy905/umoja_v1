class ProfileMedia {
  final List<String> like;
  final int commentCount;
  final String caption;
  final String videoUrl;
  ProfileMedia({
    required this.like,
    required this.commentCount,
    required this.caption,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'likes': like,
      'commentCount': commentCount,
      'caption': caption,
      'videoUrl': videoUrl,
    };
  }

  factory ProfileMedia.fromMap(Map<String, dynamic> map) {
    return ProfileMedia(
      like: List<String>.from((map['likes'])),
      commentCount: map['commentCount'] as int,
      caption: map['caption'] as String,
      videoUrl: map['videoUrl'] as String,
    );
  }

}
