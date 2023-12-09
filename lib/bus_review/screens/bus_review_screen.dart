import 'package:bus_saathi/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bus_saathi/widgets/buttons/elevated_loader_button.dart';
import 'package:camera/camera.dart';
import 'package:bus_saathi/widgets/camera/take_pic.dart';

class MyReview extends StatefulWidget {
  const MyReview({Key? key}) : super(key: key);

  @override
  State<MyReview> createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
  double _rating = 0;
  TextEditingController _reviewController = TextEditingController();
  List<CameraDescription> _cameras = <CameraDescription>[];

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    try {
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      _logError(e.code, e.description);
    }
  }

  void _logError(String code, String? description) {
    // Handle the case where 'description' might be null
    String errorMessage = description ?? 'No description available';
    print('Error: $code\nError Message: $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Review your Bus ')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Rate your experience:',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 65,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Write your review:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter your review here..',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedLoaderButton(
                  onPressed: () {
                    // logic for submitting the review and rating
                    String reviewText = _reviewController.text;
                    print('Submitted Rating: $_rating');
                    print('Submitted Review: $reviewText');
                    // logic to send the rating and review
                  },
                  label: Text('Submit Review'),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: ElevatedLoaderButton(
                  onPressed: () {
                    // Navigate to the camera screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TakePictureScreen(camera: _cameras.first),
                      ),
                    );
                  },
                  label: Text('Add Photos'),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: MyReview(),
//     ),
//   );
// }


