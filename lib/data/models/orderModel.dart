import 'package:fashionproject/domain/Entities/order_entity.dart';

class Ordermodel extends OrderEntity {
  Ordermodel({required super.date, required super.id, required super.total});

  factory Ordermodel.fromJson(Map<String, dynamic> map) {
    return Ordermodel(date: map["date"], id: map["id"], total: map["total"]);
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "total": total, "date": date.toIso8601String()};  
  }
}
