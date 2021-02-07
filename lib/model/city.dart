class Province {
  String name;
  List<City> cityList;

  bool isSelect = false;
}

class City {
  String name;
  List<Area> areaList;
  bool isSelect = false;
  City(this.name, this.areaList);
}

class Area {
  String name;
  bool isSelect = false;
  Area(this.name);
}


