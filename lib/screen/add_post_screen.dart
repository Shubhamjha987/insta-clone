import 'dart:typed_data';
import 'package:insta_clone/models/users.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/providers/user_providers.dart';
import 'package:insta_clone/utils/Colors.dart';
import 'package:insta_clone/utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  _selectImage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a post'),
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.all(20),
              child: const Text('Take a photo'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);

                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(20),
              child: const Text('Choose from Gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);

                setState(() {
                  _file = file;
                });
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    if (_file == null) {
      return Center(
        child: IconButton(
          icon: Icon(Icons.upload),
          onPressed: () => _selectImage(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text('Post to'),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Post',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.photoUrl,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Write your caption....',
                      border: InputBorder.none,
                    ),
                    maxLines: 8,
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: AspectRatio(
                    aspectRatio: 487 / 451,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://scontent-frt3-2.xx.fbcdn.net/v/t1.6435-9/127924292_2849994308591357_6919801301897946194_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=e3f864&_nc_ohc=5X47nYsZTi8AX8GEuzI&_nc_ht=scontent-frt3-2.xx&oh=00_AfD2KUcvJqOeZHwSOnwgPIQXeEHWgIw8xS-k99Pr9Dy5sQ&oe=6442ABC1',
                          ),
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ],
        ),
      );
    }
  }
}
