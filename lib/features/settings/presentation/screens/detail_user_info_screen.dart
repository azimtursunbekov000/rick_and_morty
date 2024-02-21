import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class DetailUserScreen extends StatefulWidget {
  const DetailUserScreen({Key? key}) : super(key: key);

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerQuantity = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('avatar_images');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Редактировать',
          style: TextHelper.w400s20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: _controllerName,
                  decoration:
                      const InputDecoration(hintText: 'Enter the name of the item'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the item name';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerQuantity,
                  decoration: const InputDecoration(
                      hintText: 'Enter the quantity of the item'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the item quantity';
                    }

                    return null;
                  },
                ),
                IconButton(
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      print('${file?.path}');

                      if (file == null) return;
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                          referenceRoot.child('images');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                          referenceDirImages.child('name');

                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file!.path));
                        //Success: get the download URL
                        imageUrl =
                            await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        //Some error occurred
                      }
                    },
                    icon: Icon(Icons.camera_alt)),
                ElevatedButton(
                    onPressed: () async {
                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please upload an image')));

                        return;
                      }

                      if (key.currentState!.validate()) {
                        String itemName = _controllerName.text;
                        String itemQuantity = _controllerQuantity.text;

                        Map<String, String> dataToSend = {
                          'name': itemName,
                          'quantity': itemQuantity,
                          'image': imageUrl,
                        };

                        _reference.add(dataToSend);
                      }
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
