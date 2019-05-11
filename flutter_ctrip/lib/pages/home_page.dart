import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _imageList = [
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1752460159,226752426&fm=26&gp=0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557570861950&di=4642420ff00078666c031aa5f744835e&imgtype=0&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090606%2F200906186%2520%25281%2529.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557570966021&di=257f49a701e722d0b5d071875a6dfde9&imgtype=0&src=http%3A%2F%2Fs3.sinaimg.cn%2Fmw690%2F001SAgvdzy79WoTpJ5092%26690",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557570966020&di=85a69d7edd941a928e4e8546b7f2fdd1&imgtype=0&src=http%3A%2F%2Fimg2.ph.126.net%2FGG8cvzLxob1WrCBi5upRmw%3D%3D%2F2716515000251818709.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557570966020&di=ed24d436b9c1e5b44c0f0bff82a40e45&imgtype=0&src=http%3A%2F%2Fi-stour.com%2Fpic%2F201733014163440657.jpg"
  ];
  final ScrollController _scrollController = ScrollController();
  double _barAlpha = 0.0;
  double _threshold = 35.0;
  Color _iconColor = Colors.white;
  Color _searchBarColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      double offset = _scrollController.offset; 
      _barAlpha = offset / _threshold;
      if (offset > 35.0) {
        _barAlpha = 1.0;
      } else if (offset <= 0) {
        _barAlpha = 0.0;
      }
      _iconColor = _barAlpha > 0.1 ? Colors.black : Colors.white;
      _searchBarColor = _barAlpha > 0.3 ? Colors.grey[100] : Colors.white;
      setState(() {});
      print(_barAlpha);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: <Widget>[
            ListView(
              controller: _scrollController,
              children: <Widget>[
                Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (context,index){
                      return Image.network(_imageList[index],fit: BoxFit.fill);
                    },
                    itemCount: _imageList.length,
                    pagination:SwiperPagination(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        size: 6,
                        activeSize: 7
                      )
                    ),
                  )
                ),
                Container(
                  height: 1000,
                  child: ListTile(title: Text("dfghjkl"),),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Opacity(
                  opacity: _barAlpha,
                  child: Container(
                    height: 80,
                    color: Colors.white,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.transparent,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          child: Icon(Icons.local_airport,color: _iconColor),
                          padding:EdgeInsets.only(left: 15,right: 15, bottom: 3)
                        ), 
                        Padding(
                          padding: EdgeInsets.only(left: 5,right: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _searchBarColor
                            ),
                            height: 30,
                            width: MediaQuery.of(context).size.width - 120,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 2, left: 7),
                                  child: Icon(Icons.search,color: Colors.blue),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5,bottom: 5,left: 5),
                                  child: Text("北京飞墨尔本的飞机票")
                              )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,bottom: 3),
                          child: Icon(Icons.message,color: _iconColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )
      )
    );
  }
}