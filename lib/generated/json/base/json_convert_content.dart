// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:cargo_flutter_app/model/invoice_edit_info_entity.dart';
import 'package:cargo_flutter_app/generated/json/invoice_edit_info_entity_helper.dart';
import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/generated/json/goods_resource_entity_helper.dart';
import 'package:cargo_flutter_app/model/invoice_info_entity.dart';
import 'package:cargo_flutter_app/generated/json/invoice_info_entity_helper.dart';
import 'package:cargo_flutter_app/model/invoice_entity.dart';
import 'package:cargo_flutter_app/generated/json/invoice_entity_helper.dart';
import 'package:cargo_flutter_app/model/question_detail_entity.dart';
import 'package:cargo_flutter_app/generated/json/question_detail_entity_helper.dart';
import 'package:cargo_flutter_app/model/user_info_entity.dart';
import 'package:cargo_flutter_app/generated/json/user_info_entity_helper.dart';
import 'package:cargo_flutter_app/model/question_type_entity.dart';
import 'package:cargo_flutter_app/generated/json/question_type_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case InvoiceEditInfoEntity:
			return invoiceEditInfoEntityFromJson(data as InvoiceEditInfoEntity, json) as T;			case GoodsResourceEntity:
			return goodsResourceEntityFromJson(data as GoodsResourceEntity, json) as T;			case InvoiceInfoEntity:
			return invoiceInfoEntityFromJson(data as InvoiceInfoEntity, json) as T;			case InvoiceEntity:
			return invoiceEntityFromJson(data as InvoiceEntity, json) as T;			case QuestionDetailEntity:
			return questionDetailEntityFromJson(data as QuestionDetailEntity, json) as T;			case UserInfoEntity:
			return userInfoEntityFromJson(data as UserInfoEntity, json) as T;			case UserInfoOrderVo:
			return userInfoOrderVoFromJson(data as UserInfoOrderVo, json) as T;			case UserInfoSpUserAuth:
			return userInfoSpUserAuthFromJson(data as UserInfoSpUserAuth, json) as T;			case QuestionTypeEntity:
			return questionTypeEntityFromJson(data as QuestionTypeEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case InvoiceEditInfoEntity:
			return invoiceEditInfoEntityToJson(data as InvoiceEditInfoEntity);			case GoodsResourceEntity:
			return goodsResourceEntityToJson(data as GoodsResourceEntity);			case InvoiceInfoEntity:
			return invoiceInfoEntityToJson(data as InvoiceInfoEntity);			case InvoiceEntity:
			return invoiceEntityToJson(data as InvoiceEntity);			case QuestionDetailEntity:
			return questionDetailEntityToJson(data as QuestionDetailEntity);			case UserInfoEntity:
			return userInfoEntityToJson(data as UserInfoEntity);			case UserInfoOrderVo:
			return userInfoOrderVoToJson(data as UserInfoOrderVo);			case UserInfoSpUserAuth:
			return userInfoSpUserAuthToJson(data as UserInfoSpUserAuth);			case QuestionTypeEntity:
			return questionTypeEntityToJson(data as QuestionTypeEntity);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'InvoiceEditInfoEntity':
			return InvoiceEditInfoEntity().fromJson(json);			case 'GoodsResourceEntity':
			return GoodsResourceEntity().fromJson(json);			case 'InvoiceInfoEntity':
			return InvoiceInfoEntity().fromJson(json);			case 'InvoiceEntity':
			return InvoiceEntity().fromJson(json);			case 'QuestionDetailEntity':
			return QuestionDetailEntity().fromJson(json);			case 'UserInfoEntity':
			return UserInfoEntity().fromJson(json);			case 'UserInfoOrderVo':
			return UserInfoOrderVo().fromJson(json);			case 'UserInfoSpUserAuth':
			return UserInfoSpUserAuth().fromJson(json);			case 'QuestionTypeEntity':
			return QuestionTypeEntity().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'InvoiceEditInfoEntity':
			return List<InvoiceEditInfoEntity>();			case 'GoodsResourceEntity':
			return List<GoodsResourceEntity>();			case 'InvoiceInfoEntity':
			return List<InvoiceInfoEntity>();			case 'InvoiceEntity':
			return List<InvoiceEntity>();			case 'QuestionDetailEntity':
			return List<QuestionDetailEntity>();			case 'UserInfoEntity':
			return List<UserInfoEntity>();			case 'UserInfoOrderVo':
			return List<UserInfoOrderVo>();			case 'UserInfoSpUserAuth':
			return List<UserInfoSpUserAuth>();			case 'QuestionTypeEntity':
			return List<QuestionTypeEntity>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}