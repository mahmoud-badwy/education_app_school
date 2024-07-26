import 'package:flutter/material.dart';
import '../../domain/usecases/get_videos.dart';
import '../../domain/entities/video.dart';

class VideoProvider with ChangeNotifier {
  final GetVideosBySubject getVideosBySubject;
  List<Video> _videos = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Video> get videos => _videos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  VideoProvider({required this.getVideosBySubject});

  Future<void> fetchVideos(String subjectId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _videos = await getVideosBySubject(subjectId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
