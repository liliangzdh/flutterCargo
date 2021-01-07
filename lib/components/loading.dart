import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  final String text;
  final GestureTapCallback onTap;

  Loading(this.isLoading, {this.text = '加载中...', this.onTap});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoadingMain();
    }
    return Container();
  }

  Widget _buildLoadingMain() {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: double.infinity,
        child: _buildLoading(),
      ),
    );
  }

  Widget _buildLoading() {
    return new Center(
      child: new SizedBox(
        width: 130,
        height: 130,
        child: new Container(
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(ColorConfig.baseColorPrime),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  text == null ? '加载中...' : text,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
