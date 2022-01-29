import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PhotoAvatar extends StatefulWidget {
  final Function submitFn;
  const PhotoAvatar({
    Key? key,
    required this.submitFn,
  }) : super(key: key);

  @override
  _PhotoAvatarState createState() => _PhotoAvatarState();
}

class _PhotoAvatarState extends State<PhotoAvatar> {
  bool _imageSelected = false;
  File? pickedImage;
  final picker = ImagePicker();

  Future<void> pickProfilePic(bool withcamera) async {
    XFile? image;
    try {
      if (withcamera) {
        image = await picker.pickImage(
            source: ImageSource.camera,
            imageQuality: 100,
            maxHeight: 800,
            maxWidth: 800);
      } else {
        image = await picker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 50,
            maxHeight: 800,
            maxWidth: 800);
      }

      setState(() {
        pickedImage = File(image!.path);
        _imageSelected = true;
      });
      widget.submitFn(pickedImage);
    } catch (err) {
      debugPrint(err.toString());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 100,
          backgroundColor: Theme.of(context).primaryColor,
          backgroundImage: _imageSelected ? FileImage(pickedImage!) : null,
          child: _imageSelected
              ? null
              : const Center(
                  child: Text(
                  'No photo selected',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () => pickProfilePic(false),
                icon: Icon(
                  Icons.photo,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text('Choose Image',
                    style: TextStyle(color: Theme.of(context).primaryColor))),
            TextButton.icon(
              onPressed: () => pickProfilePic(true),
              icon: Icon(Icons.camera, color: Theme.of(context).primaryColor),
              label: Text(
                'Take Picture',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
