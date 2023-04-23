import 'package:flutter/material.dart';
import 'package:insta_clone/screen/add_post_screen.dart';
import 'package:insta_clone/screen/profile_screen.dart';
import '../screen/feed_screen.dart';
import '../screen/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notif'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
