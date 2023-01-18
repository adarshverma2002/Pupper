class dogsImage {
  String? status;
  List<String>? message;

  dogsImage({this.status, this.message});

  dogsImage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
