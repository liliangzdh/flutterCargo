import 'package:cargo_flutter_app/api/invoice_api.dart';
import 'package:cargo_flutter_app/components/loading.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/invoice_edit_info_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:cargo_flutter_app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// 开票信息 编辑
class InvoiceInfoEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InvoiceInfoEdit();
  }
}

class _InvoiceInfoEdit extends State<InvoiceInfoEdit> {
  final bankController = TextEditingController();
  final bankNumController = TextEditingController();
  final companyAddressController = TextEditingController();
  final companyPhoneController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final remarkController = TextEditingController();

  FocusNode blankNode = FocusNode();

  InvoiceEditInfoEntity entity;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getInvoiceInfo();
  }

  getInvoiceInfo() async {
    AppResponse appResponse = await InvoiceApi.getInvoiceInfo();
    if (!mounted) {
      return;
    }
    if (!appResponse.isOk()) {
      ToastUtils.show(msg: appResponse.msg);
      return;
    }
    setState(() {
      entity = InvoiceEditInfoEntity().fromJson(appResponse.data);
      isLoading = false;
      bankController.text = entity.bank ?? '';
      bankNumController.text = entity.bankAccount ?? '';
      companyAddressController.text = entity.companyAddress ?? '';
      companyPhoneController.text = entity.companyPhone ?? '';
      nameController.text = entity.collectName ?? '';
      addressController.text = entity.collectAddress ?? '';
      phoneController.text = entity.collectPhone ?? '';
      remarkController.text = entity.remarks ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // 键盘是否展示。
    bool isKeyboardShow = MediaQuery.of(context).viewInsets.vertical > 0;
    return Scaffold(
      backgroundColor: ColorConfig.color_f4f4f4,
      appBar: AppBar(
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
        title: Text('编辑发票'),
      ),
      body: GestureDetector(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              entity == null
                  ? Container()
                  : Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              getItem('发票抬头', '${entity.companyName ?? ''}'),
                              getItem('税号', '${entity.taxNum ?? ''}'),
                              getCanEditItem('开户银行', "请输入开户银行", bankController,
                                  TextInputType.multiline),
                              getCanEditItem('银行账户', '请输入开户银行卡号',
                                  bankNumController, TextInputType.number),
                              getCanEditItem(
                                  '企业地址',
                                  '请输入企业地址',
                                  companyAddressController,
                                  TextInputType.multiline),
                              getCanEditItem('企业电话', '请输入企业电话',
                                  companyPhoneController, TextInputType.number),
                              getCanEditItem('收件人地址', '请输入收件人地址',
                                  addressController, TextInputType.multiline),
                              getCanEditItem('收件人姓名', '请输入收件人姓名',
                                  nameController, TextInputType.multiline),
                              getCanEditItem('收件人电话', '请输入收件人电话',
                                  phoneController, TextInputType.number),
                              getCanEditItem('备注', '请输入备注', remarkController,
                                  TextInputType.multiline),
                            ],
                          ),
                        ),
                      ),
                    ),
              isKeyboardShow
                  ? Container()
                  : Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(30),
                      height: 46,
                      child: MyRaisedButton(
                        onPressed: commit,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: ColorConfig.color_4DA0FF,
                        highlightColor: ColorConfig.color60,
                        child: Text(
                          '保存修改',
                          style: TextStyle(
                            color: ColorConfig.colorfff,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
              Loading(isLoading),
            ],
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(blankNode);
        },
      ),
    );
  }

  Widget getItem(String title, String name) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      color: ColorConfig.colorfff,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorConfig.color_f4f4f4,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              child: Text(
                '$title',
                style: TextStyle(
                  color: ColorConfig.color33,
                ),
              ),
              width: 100,
            ),
            Expanded(
              child: Container(
                child: Text(
                  '$name',
                  style: TextStyle(
                    color: ColorConfig.color33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCanEditItem(String title, String hintText,
      TextEditingController controller, keyboardType) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: ColorConfig.colorfff,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorConfig.color_f4f4f4,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              child: Text(
                '$title',
                style: TextStyle(
                  color: ColorConfig.color33,
                ),
              ),
              width: 100,
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 80,
                  minHeight: 50,
                ),
                child: TextField(
                  maxLines: keyboardType == TextInputType.number ? 1 : null,
                  controller: controller,
                  keyboardType: keyboardType,
                  style: TextStyle(
                    color: ColorConfig.color33,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: ColorConfig.color_999,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  commit() async {
    setState(() {
      isLoading = true;
    });

    var bank = bankController.text;
    if (bank == null || bank.length == 0) {
      ToastUtils.show(msg: '请输入开户行！');
      return;
    }

    var bankAccount = bankNumController.text;
    if (bankAccount == null || bankAccount.length == 0) {
      ToastUtils.show(msg: '请输入开户行账户！');
      return;
    }

    var companyAddress = companyAddressController.text;
    if (companyAddress == null || companyAddress.length == 0) {
      ToastUtils.show(msg: '请输入企业地址！');
      return;
    }

    var companyPhone = companyPhoneController.text;
    if (companyPhone == null || companyPhone.length == 0) {
      ToastUtils.show(msg: '请输入企业电话！');
      return;
    }

    var collectName = nameController.text;
    if (collectName == null || collectName.length == 0) {
      ToastUtils.show(msg: '请输入收件人姓名！');
      return;
    }

    var collectPhone = phoneController.text;
    if (collectPhone == null || collectPhone.length == 0) {
      ToastUtils.show(msg: '请输入收件人电话！');
      return;
    }

    var collectAddress = addressController.text;
    if (collectAddress == null || collectAddress.length == 0) {
      ToastUtils.show(msg: '请输入收件人地址！');
      return;
    }

    var remarks = remarkController.text ?? '';
    AppResponse appResponse =await InvoiceApi.editInvoiceInfo({
      "bank": bank,
      "bankAccount":bankAccount,
      "companyAddress":companyAddress,
      "companyPhone":companyPhone,

      "collectAddress":collectAddress,
      "collectName":collectName,
      "collectPhone":collectPhone,

      "remarks":remarks,

      "id":entity.id,
      "riesType":entity.riesType,

      "taxNum":entity.taxNum,
      "companyName":entity.companyName,
    });
    setState(() {
      isLoading = false;
    });
    if(appResponse.isOk()){
      RouteUtils.goBack(context);
    }else{
      ToastUtils.show(msg: appResponse.msg);
    }
  }
}
