import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriteJokesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Омилени шеги'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('favorite_jokes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final favoriteJokes = snapshot.data!.docs;
          return ListView.builder(
            itemCount: favoriteJokes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favoriteJokes[index]['jokeText']),
              );
            },
          );
        },
      ),
    );
  }
}

