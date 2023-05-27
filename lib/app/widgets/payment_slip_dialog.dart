import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({required this.docId});

  final String docId;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _uploading = false; // Flag to track if upload is in progress

  Future<CroppedFile?> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper.platform
        .cropImage(sourcePath: imageFile.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ], uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true,
        showCropGrid: true, // Enable the crop grid
      ),
      IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    ]);

    return croppedFile;
  }

  Future<void> _uploadImageToFirebase() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      CroppedFile? croppedImage = await _cropImage(File(pickedImage.path));

      if (croppedImage != null) {
        // Create a new File object from the cropped image path
        File croppedFile = File(croppedImage.path);

        setState(() {
          _uploading = true; // Start the upload and show the spinner
        });

        // Upload the cropped image to Firebase Storage
        Reference storageReference =
            _storage.ref().child('payment_slips').child('example.jpg');
        UploadTask uploadTask = storageReference.putFile(croppedFile);
        TaskSnapshot storageSnapshot =
            await uploadTask.whenComplete(() => null);
        String imageUrl = await storageSnapshot.ref.getDownloadURL();

        // Update the image URL in the Firestore collection
        String documentId = widget.docId; // Replace with the actual document ID
        await _firestore.collection('waste_request').doc(documentId).update({
          'imageUrl': imageUrl,
        });

        // Show a snackbar indicating successful upload
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image uploaded successfully'),
          ),
        );
      }

      // Close the dialog after successful upload or cancellation
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Waste Management',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Please upload your EasyPaisa payment screenshot to the database. After uploading, you can check the status of your request. The administrator will review your submission and approve the request if everything is in order.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Admin EasyPaisa Number:',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '03470504373',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () async {
                    const String adminNumber = '03470504373';
                    await Clipboard.setData(
                        const ClipboardData(text: adminNumber));
                    // Show a snackbar or toast indicating that the number has been copied
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Number copied to clipboard')),
                    );
                  },
                  child: const Text("Copy"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            if (_uploading) // Show spinner if upload is in progress
              // ignore: prefer_const_constructors
              Center(child: const CircularProgressIndicator())
            else
              GenericButton(
                width: 300.w,
                onTap: _uploadImageToFirebase,
                text: 'Upload Screenshot Here',
              ),
          ],
        ),
      ),
    );
  }
}
