class SelectArea {
  String province;
  String city;
  String area;

  String detailAddress; // 详情地址

  SelectArea();

  String toProvinceCityAreaString() {
    return '${province ?? ''} ${city ?? ''} ${area ?? ""}';
  }

  SelectArea.createSelectArea(this.province, this.city, this.area);
}

class Province {
  String name;
  List<City> cityList;
}

class City {
  String name;
  List<Area> areaList;

  City(this.name, this.areaList);
}

class Area {
  String name;

  Area(this.name);
}
