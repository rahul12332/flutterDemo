import 'package:demo/constants/app_color.dart'; // Ensure this is correct and includes AppColors
import 'package:demo/features/detailScreen/detailRepo/detailRepo.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final dynamic userId;
  final dynamic id;
  final String title;
  final String body;

  const DetailScreen({
    Key? key,
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController? bodyController;

  @override
  void initState() {
    DetailRepo.postDetail(userId: widget.userId, id: widget.id, title: widget.title, body: widget.body);
    bodyController = TextEditingController(text: widget.body);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Detail Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title Display
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // TextFormField for the body inside a bordered container
            Padding(
              padding: const EdgeInsets.all(10.0), // Adding padding inside the container
              child: TextFormField(
                controller: bodyController,
                maxLines: 8, // Allows multiple lines for the body content
                decoration: InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter body text';
                  }
                  return null;
                },
              ),
            ),

            const Spacer(),

            // Submit Button
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                ),
                onPressed: () {
                  // Add submit logic here
                },
                child: const Text("Submit", style: TextStyle( color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
