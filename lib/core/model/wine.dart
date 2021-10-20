
class Wine {
  String id = "";
  String name = "";
  String c_id = "";
  String m_id = "";
  int c_dt = -1;
  int m_dt = -1;

  Wine({required this.id});

  Wine.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    c_id = json['c_id'];
    m_id = json['m_id'];
    c_dt = json['c_dt'];
    m_dt = json['m_dt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
