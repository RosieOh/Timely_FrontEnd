class TimeShare {
  final String userId;
  final DateTime sharedAt;
  final String content;

  TimeShare({
    required this.userId,
    required this.sharedAt,
    required this.content,
  });

  factory TimeShare.fromJson(Map<String, dynamic> json) {
    return TimeShare(
      userId: json['userId'],
      sharedAt: DateTime.parse(json['sharedAt']),
      content: json['content'],
    );
  }
}
