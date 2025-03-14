import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/data/order_entity.dart';

import '../../../../../core/enums/order_enum.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderItem({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Price
            Row(
              children: [
                Text(
                  'Total Price: \$${orderEntity.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                // Order Status
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        orderEntity.status == OrderEnum.pending
                            ? Colors.amber
                            : orderEntity.status == OrderEnum.accepted
                            ? Colors.green
                            : orderEntity.status == OrderEnum.delivered
                            ? Colors.blue
                            : Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    orderEntity.status.name,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // User ID
            Text(
              'User ID: ${orderEntity.uId}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Shipping Address
            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              orderEntity.shippingAddressModel.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),

            // Payment Method
            Text(
              'Payment Method: ${orderEntity.paymentMethod}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Order Products
            const Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderEntity.orderProducts.length,
              itemBuilder: (context, index) {
                final product = orderEntity.orderProducts[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    placeholder:
                        (context, url) => SizedBox(
                          width: 24,
                          height: 24,
                          child: const CircularProgressIndicator(),
                        ),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'Quantity: ${product.quantity} | Price: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
