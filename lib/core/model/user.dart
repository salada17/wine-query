class User {
  String id = "";
  String name = "";
  String email = "";
  String password = "";
  String sex = "";
  String state = "";
  String accessToken = '';
  String refreshToken = '';
  String c_id = "";
  String m_id = "";
  int c_dt = -1;
  int m_dt = -1;

  User({required this.id, required this.name, required this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    state = json['state'];
    sex = json['sex'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    c_id = json['c_id'];
    m_id = json['m_id'];
    c_dt = json['c_dt'];
    m_dt = json['m_dt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['sex'] = this.sex;
    data['state'] = this.state;
    return data;
  }
}
