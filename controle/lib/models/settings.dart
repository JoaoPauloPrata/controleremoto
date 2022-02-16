class Settings {
  Settings(
    this.mouseSensitivity,
    this.scrollSensitivity,
    this.leftButtonKey,
    this.rightButtonKey,
    this.downButtonKey,
    this.upButtonKey,
    this.startButtonKey,
    this.selectButtonKey,
    this.upCircleButtonKey,
    this.leftCircleButtonKey,
    this.rightCircleButtonKey,
    this.downCircleButtonKey,
  );
  double mouseSensitivity;
  double scrollSensitivity;
  String leftButtonKey;
  String rightButtonKey;
  String downButtonKey;
  String upButtonKey;
  String startButtonKey;
  String selectButtonKey;
  String upCircleButtonKey;
  String leftCircleButtonKey;
  String rightCircleButtonKey;
  String downCircleButtonKey;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'mouseSensitivity': mouseSensitivity,
      'scrollSensitivity': scrollSensitivity,
      'leftButtonKey': leftButtonKey,
      'rightButtonKey': rightButtonKey,
      'downButtonKey': downButtonKey,
      'upButtonKey': upButtonKey,
      'startButtonKey': startButtonKey,
      'selectButtonKey': selectButtonKey,
      'upCircleButtonKey': upCircleButtonKey,
      'leftCircleButtonKey': leftCircleButtonKey,
      'rightCircleButtonKey': rightCircleButtonKey,
      'downCircleButtonKey': downCircleButtonKey,
    };
    return map;
  }

  fromMap(Map<String, dynamic> map) {
    mouseSensitivity = map['mouseSensitivity'];
    scrollSensitivity = map['scrollSensitivity'];
    leftButtonKey = map['leftButtonKey'];
    rightButtonKey = map['rightButtonKey'];
    downButtonKey = map['downButtonKey'];
    upButtonKey = map['upButtonKey'];
    startButtonKey = map['startButtonKey'];
    selectButtonKey = map['selectButtonKey'];
    upCircleButtonKey = map['upCircleButtonKey'];
    leftCircleButtonKey = map['leftCircleButtonKey'];
    rightCircleButtonKey = map['rightButtonKey'];
    downCircleButtonKey = map['downCircleButtonKey'];
  }
}
