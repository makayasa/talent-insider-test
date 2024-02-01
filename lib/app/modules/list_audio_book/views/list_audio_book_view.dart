import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_audio_book_controller.dart';

class ListAudioBookView extends GetView<ListAudioBookController> {
  const ListAudioBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAudioBookView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAudioBookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
