import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/video_provider.dart';
import 'video_details_screen.dart';

class CourseDetailsScreen extends StatelessWidget {
  final String subjectId;

  const CourseDetailsScreen({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    // Fetch videos when screen is loaded
    videoProvider.fetchVideos(subjectId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: videoProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : videoProvider.errorMessage != null
          ? Center(child: Text('Error: ${videoProvider.errorMessage}'))
          : ListView.builder(
        itemCount: videoProvider.videos.length,
        itemBuilder: (context, index) {
          final video = videoProvider.videos[index];
          return ListTile(
            title: Text(video.title),
            subtitle: Text('Published: ${video.publishDate.toLocal()}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoDetailsScreen(
                    video: video,
                    hasPurchased: true, // Pass actual purchase status here
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
