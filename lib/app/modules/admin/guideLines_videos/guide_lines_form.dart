import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_text_field_validatior.dart';

import '../../../utils/colors.dart';
import '../../../widgets/generic_text_form_request_field.dart';

class GuideLinesForm extends StatelessWidget {
  const GuideLinesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Upload New Video',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 12),
            RequestForm(),
          ],
        ),
      ),
    );
  }
}

class RequestForm extends StatefulWidget {
  RequestForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  // Forgot - Password - Form - State
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();

  final TextEditingController link = TextEditingController();

  final firestoreInstance = FirebaseFirestore.instance;

  bool _isLoading = false;

  Future<void> addVideoToGuidelines(String title, String link) async {
    setState(() {
      _isLoading = true; // show spinner when upload button is pressed
    });

    try {
      await firestoreInstance.collection('guidelines').add({
        'title': title,
        'link': link,
      });
      print('Video added to guidelines');
    } catch (e) {
      print('Error adding video to guidelines: $e');
    } finally {
      setState(() {
        _isLoading =
            false; // hide spinner when upload is complete (whether successful or not)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericRequestFormFIeld(
            validator: requiredValidator,
            controller: title,
            hintText: "Enter the title",
            title: "Title",
          ),
          SizedBox(height: 12.h),
          GenericRequestFormFIeld(
            validator: requiredValidator,
            controller: link,
            hintText: "Enter the youtube video link",
            title: "Link",
          ),
          SizedBox(height: 22.h),
          GenericButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await addVideoToGuidelines(title.text, link.text);
                  Get.snackbar(
                      "Message", 'The video is submitted to database!');
                  Navigator.pop(context);
                } else {}
              },
              text: "Upload"),
          SizedBox(height: 22.h),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
