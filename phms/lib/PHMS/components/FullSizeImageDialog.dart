import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;


class FullSizeImageDialog extends StatelessWidget {
  final String imageUrl;

  FullSizeImageDialog({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width-100;
    double screenHeight = MediaQuery.of(context).size.height-200;

    return Dialog(
      child: Container(
        width: screenWidth,
        height: 300,
        child: Image.network(
          imageUrl,
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              // Image is fully loaded
              return child;
            } else {
              // Image is still loading, you can display a loading indicator or check loadingProgress
              return CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              );
            }
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            // Error occurred while loading the image
            return Container(
              decoration:
              BoxDecoration(
                borderRadius:
                BorderRadius
                    .circular(
                    3.0),
                border: Border.all(
                  color: Constants
                      .UavPrimaryColor,
                  width: 1.0,
                ),
              ),
              child: Container(
                width: 100.0,
                height: 100.0,
                child: Icon(
                  Icons
                      .camera_alt_outlined,
                  size: 80.0,
                  color:
                  Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}