货主端版 Flutter App

# 使用的包
- json 插件 
  FlutterJsonBeanFactory 是用来生成dart的json实体类和根据配置生成factory的idea全家桶的插件.
  【https://www.jianshu.com/p/14cbcbaa74b7?tdsourcetag=s_pcqq_aiomsg】
  
- fluro 路由
- shared_preferences 保存 token 类似小量常用的的数据工具
- fluttertoast toast 
- rxdart 通知类
- crypto 加密的，md5加密用到
- pull_to_refresh 上拉加载更多。下拉刷新的控件

# 导入自己 本地的包。
- 列如 你需要导入 utils 。这样导入 ，最佳、
import 'package:cargo_flutter_app/utils/toast_utils.dart';

# 关于接口。按 后端接口来命名和划分文件。 接口统一放在 api 文件夹里面
```
这样的接口 ApiManger.instance.sendRequest("user/newConvenientLogin", "post", param);

在 文件 user_api 里面。 写个 UserApi 类。调用 UserApi.newConvenientLogin
```

# 状态管理。统一使用 单列全局 bloc 管理。这个简单好用。

# 代码风格 
- 使用 类似 mvvm ，页面布局和逻辑代码分离。类似 Login.dart 和 LoginViewModel。这两个文件组成一个登陆 页面。
- 简单的没有啥操作的，可以直接setState()。


# PageView 可以缓存 使用 AutomaticKeepAliveClientMixin。
