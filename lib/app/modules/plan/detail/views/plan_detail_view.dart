import 'package:eradah/app/data/component/CustomImageCached.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/modules/plan/model/plan_video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/plan_detail_controller.dart';

class PlanDetailView extends StatefulWidget {
  PlanDetailView(this.myshowVedio);
  final MyVedio myshowVedio;
  @override
  _PlanDetailViewState createState() => _PlanDetailViewState();
}

class _PlanDetailViewState extends State<PlanDetailView> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.myshowVedio.vedio)
      ..initialize().then((_) {
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // _controller = new VideoPlayerController();

    return Scaffold(
      appBar: AppBar(
        title: Text('التجارب المبكرة'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Stack(
                children: [
                  Center(
                    child: _controller.value.isInitialized
                        ? SizedBox(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          )
                        : CustomImageCached(
                            imageUrl: widget.myshowVedio.img,
                          ),
                  ),
                  Positioned.fill(
                    child: InkWell(
                      onTap: () {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                        setState(() {});
                      },
                      child: _controller.value.isPlaying
                          ? Container(
                              child: Center(
                                child: Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                  size: 0,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.4),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: 64,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(color: KprimaryColor),
                  child: ListTile(
                    title: Text(
                      widget.myshowVedio.title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      widget.myshowVedio.descCat,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    leading: Icon(
                      Icons.category,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Html(
                    data: widget.myshowVedio.details,
                  ),
                ),
              ),
              Divider(),
            
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }



}
