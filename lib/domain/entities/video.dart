class Video {
  final String id;
  final String title;
  final String description;
  final String teacherId;
  final DateTime publishDate;
  final List<String> attachedFiles;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.teacherId,
    required this.publishDate,
    required this.attachedFiles,
  });
}
