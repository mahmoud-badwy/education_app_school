import 'package:flutter/material.dart';
import '../../../domain/entities/video.dart';

class VideoDetailsScreen extends StatelessWidget {
  final Video video;
  final bool hasPurchased;

  VideoDetailsScreen({required this.video, required this.hasPurchased});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${video.title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Published Date: ${video.publishDate.toLocal()}'),
            SizedBox(height: 8),
            Text('Teacher ID: ${video.teacherId}'),
            SizedBox(height: 8),
            Text('Description: ${video.description}'),
            SizedBox(height: 16),
            Text('Attached Files:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...video.attachedFiles.map((file) => ListTile(
              title: Text(file),
              onTap: () {
                if (hasPurchased) {
                  // Open PDF or video file
                  // You may use a package like flutter_full_pdf_viewer or video_player
                } else {
                  // Show a message or disable interaction
                }
              },
            )),
            SizedBox(height: 16),
            if (hasPurchased)
              ElevatedButton(
                onPressed: () {
                  // Play video
                  // You may use the video_player package
                },
                child: Text('Play Video'),
              ),
          ],
        ),
      ),
    );
  }
}
