import 'package:flutter/material.dart';
import 'package:house/src/data/models/hotel_models.dart';
import 'package:intl/intl.dart';

class ListItemWidgets extends StatelessWidget {
  ListItemWidgets({super.key, required this.data});

  final Entry data;
  final NumberFormat usCurrency = NumberFormat('#,##0', 'en_US');

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data.thumbnail ?? ''))),
        ),
        title: Text(
          data.hotelName ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.city ?? '',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Start From:',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            RichText(
                text: TextSpan(
                    text: '\$${usCurrency.format(data.price)}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.red),
                    children: [
                  TextSpan(
                      text: ' / per room per night',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.black))
                ]))
          ],
        ));
  }
}
