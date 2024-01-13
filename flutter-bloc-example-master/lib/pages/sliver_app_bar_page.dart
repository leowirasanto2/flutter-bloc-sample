import 'package:flutter/material.dart';

class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _getHeaderBannerWidget(context),
          // SliverToBoxAdapter(
          //   child: Container(
          //     color: Color(0xff5c63f1),
          //     height: 20,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: <Widget>[
          //         Container(
          //           height: 20,
          //           decoration: const BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(20.0),
          //               topRight: Radius.circular(20.0),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
            childCount: 10,
          )),
        ],
      ),
    );
  }
}

Widget _getHeaderBannerWidget(BuildContext context) {
  return SliverAppBar(
    bottom: PreferredSize(
      child: Container(),
      preferredSize: const Size(0, 20),
    ),
    pinned: true,
    expandedHeight: MediaQuery.of(context).size.height * 0.3,
    flexibleSpace: Stack(
      children: [
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/02/15/401255779.jpg"),
          ),
        ),
        Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  )),
            ))
      ],
    ),
  );
}
