class AssetsPath {
  static final AssetsPath _instance = AssetsPath._init();
  AssetsPath._init();

  factory AssetsPath() {
    return _instance;
  }

  final String peakyBlinders = "assets/images/peaky_blinders.svg";
}
