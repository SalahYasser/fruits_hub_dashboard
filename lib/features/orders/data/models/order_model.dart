import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import '../../../../core/enums/order_enum.dart';
import '../../domain/entities/data/order_entity.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    required this.orderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddressModel'],
      ),
      orderProducts: List<OrderProductModel>.from(
        json['orderProducts'].map((x) => OrderProductModel.fromJson(x)),
      ),
      paymentMethod: json['paymentMethod'],
      status: json['status'],
      orderId: json['orderId'],
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'Pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  toEntity() => OrderEntity(
    orderId: orderId,
    totalPrice: totalPrice,
    uId: uId,
    shippingAddressModel: shippingAddressModel.toEntity(),
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
    status: fetchEnum(),
  );

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
