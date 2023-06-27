import 'package:camera/camera.dart';
import 'package:chatpal/cameraUtil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class photoTab extends StatefulWidget {
  const photoTab({super.key});

  @override
  State<photoTab> createState() => _photoTabState();
}

class _photoTabState extends State<photoTab> {
  List<CameraDescription>? cameras;
  late CameraController controller;
  bool _cameraInitialized = false;
  String? imagePath;  // Stores the path to the captured image
  XFile? videoFile;// Stores the video file after recording
  String? videoPath;
  int selectedCameraIndex = 0; // add this line

  @override
  void initState() {
    super.initState();
    _initCamera();
  }


  Future<void> _initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras!.first, ResolutionPreset.ultraHigh);
    await controller.initialize();
    setState(() {
      _cameraInitialized = true;
    });
  }
  // This method captures an image and stores the path
  void onCaptureButtonPress() async {
    try {
      final XFile file = await controller.takePicture();
      setState(() {
        imagePath = file.path;
      });
    } catch (e) {
      print(e);
    }
  }

  void _flipCamera() async {
    // Stop the current camera and change the selected index
    await controller.dispose();
    if (selectedCameraIndex >= cameras!.length - 1) {
      selectedCameraIndex = 0;
    } else {
      selectedCameraIndex++;
    }

    // Create new camera controller
    controller = CameraController(cameras![selectedCameraIndex], ResolutionPreset.ultraHigh);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }


  // This method starts video recording
  void onCaptureButtonHold() async {
    try {
      await controller.startVideoRecording();
    } catch (e) {
      print(e);
    }
  }

// This method stops video recording and stores the video file
  void onCaptureButtonRelease() async {
    try {
      videoFile = await controller.stopVideoRecording();
      setState(() {
        videoPath = videoFile?.path;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraInitialized) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Stack(
        children: [
          // Use a Transform.scale to scale the CameraPreview to the full screen size
          Container(
            height: double.infinity,
            child: CameraPreview(controller),
          ),
          Align(
            alignment: Alignment.bottomCenter,

              child: GestureDetector(
                onTap: onCaptureButtonPress,
                // Start recording a video on long press
                onLongPress: onCaptureButtonHold,
                // Stop recording the video on long press end
                onLongPressEnd: (details) => onCaptureButtonRelease(),

                child: Container(
                  width: 75.0,
                  height: 90.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey,  // Color for the inside of the circle
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(FontAwesomeIcons.circle, color: Colors.white, size: 80.0),
                  ),
                )

            ),

          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
                onPressed: () {
                  cameraUtil.openGallerywithMultiSelect(context);
                  // Open Gallery Here
                },
                icon: const Icon(FontAwesomeIcons.photoVideo, color: Colors.white, size: 40),
                color: Colors.black54,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                _flipCamera();
                // Open Gallery Here
              },
              icon: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 40),
              color: Colors.black54,
            ),
          )
        ],
      );
    }
  }
}
