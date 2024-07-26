import '../../domain/entities/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel extends Video {
  VideoModel({
    required String id,
    required String title,
    required String description,
    required String teacherId,
    required DateTime publishDate,
    required List<String> attachedFiles,
  }) : super(
    id: id,
    title: title,
    description: description,
    teacherId: teacherId,
    publishDate: publishDate,
    attachedFiles: attachedFiles,
  );

  factory VideoModel.fromFirestore(Map<String, dynamic> data) {
    return VideoModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      teacherId: data['teacherId'],
      publishDate: (data['publishDate'] as Timestamp).toDate(),
      attachedFiles: List<String>.from(data['attachedFiles']),
    );
  }
}
