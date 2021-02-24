import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../line.dart';
import '../raised_button.dart';

/// 货物信息 选择

class GoodsInfoSelect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoodsInfoSelect();
  }
}

class _GoodsInfoSelect extends State<GoodsInfoSelect> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CommonUtils.getScreenHeight(context) * 2 / 3,
      child: Column(
        children: [
          // 头部
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            child: Row(
              children: [
                Container(
                  width: 50,
                  child: MyRaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '关闭',
                      style: TextStyle(
                        color: ColorConfig.color_999,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      '货物信息',
                      style: TextStyle(
                        color: ColorConfig.color00,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                  width: 50,
                  child: MyRaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '确定',
                      style: TextStyle(
                        color: ColorConfig.color_4DA0FF,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Line(),

          // 搜索
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: ColorConfig.color_f4f4f4,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      maxLines: 1,
                      controller: controller,
                      onChanged: onSearchTextChange,
                      style: TextStyle(
                        color: ColorConfig.color33,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: '搜索',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: ColorConfig.color_999,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        isCollapsed: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // 热门类型 标题
          Container(
            height: 30,
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '热门类型',
                  style: TextStyle(
                    color: ColorConfig.color00,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '更多',
                        style: TextStyle(
                          color: ColorConfig.color_999,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: ColorConfig.color_999,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  onSearchTextChange(String str) {}
}
