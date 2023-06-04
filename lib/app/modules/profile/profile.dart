import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_close_loop_recycling/app/modules/signin/widgets/generic_default_button.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_text_field.dart';

import '../../utils/colors.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isEditing = false;
  File? _image;
  bool _isUploading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY_BACK_COLOR,
        title: const Text('Profile'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final imageUrl = userData['imageUrl'] ?? '';

          _nameController.text = userData['name'];
          _emailController.text = userData['email'];

          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                if (imageUrl.toString().isNotEmpty && _image == null)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            child: Image.network(imageUrl),
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 64.w,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  )
                else if (_image != null)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            child: Image.file(_image!),
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 64.w,
                      backgroundColor: Colors.transparent,
                      backgroundImage: FileImage(_image!, scale: 0.33),
                    ),
                  )
                else
                  CircleAvatar(
                    radius: 64.w,
                    backgroundColor: Colors.blue,
                    child: const Text("No image Selected"),
                  ),
                const SizedBox(height: 16.0),
                GenericTextField(
                  t: true,
                  hintText: 'Name',
                  prefixIcon: FilePath.PERSON_ICON,
                  controller: _nameController,
                ),
                const SizedBox(height: 8.0),
                GenericTextField(
                  enabled: false,
                  t: true,
                  hintText: 'Email',
                  prefixIcon: FilePath.EMAIL_ICON,
                  controller: _emailController,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'You cannot change your email and password here. Please contact the admin.',
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: const Text('Forgot Password'),
                    onPressed: () =>
                        _showForgotPasswordDialog(_emailController.text),
                  ),
                ),
                const SizedBox(height: 16.0),
                if (_isEditing)
                  Column(
                    children: [
                      GenericButton(
                        isBackground: true,
                        text: 'Pick Image',
                        onPressed: _pickImage,
                      ),
                    ],
                  ),
                if (!_isEditing)
                  GenericButton(
                    isBackground: true,
                    text: 'Edit Profile',
                    onPressed: () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                  ),
                SizedBox(height: 12.h),
                if (_isEditing && !_isUploading)
                  GenericButton(
                    isBackground: true,
                    text: 'Submit',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _updateUserProfile(imageUrl);
                      }
                    },
                  ),
                if (_isUploading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _updateUserProfile(String userImageUrl) async {
    final name = _nameController.text;

    setState(() {
      _isUploading = true;
    });

    try {
      String imageUrl = userImageUrl;

      if (_image != null) {
        imageUrl = await _uploadImageToFirebase(_image!);
      }

      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': name,
        'imageUrl': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );

      setState(() {
        _isEditing = false;
        _isUploading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update profile')),
      );
    }
  }

  Future<String> _uploadImageToFirebase(File image) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images/${FirebaseAuth.instance.currentUser!.uid}.jpg');
    final uploadTask = storageRef.putFile(image);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _showForgotPasswordDialog(String email) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Forgot Password'),
          content: const Text('Are you sure you want to reset your password?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email);
                  _showEmailSentDialog();
                } catch (e) {
                  _showEmailFailedDialog();
                }
              },
              child: const Text('Send Email'),
            ),
          ],
        );
      },
    );
  }

  void _showEmailSentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Forgot Password'),
          content: const Text(
              'A password reset email has been sent to your registered email address.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showEmailFailedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Forgot Password'),
          content: const Text(
              'Failed to send password reset email. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
