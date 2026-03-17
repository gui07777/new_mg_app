import 'package:flutter/material.dart';
import 'package:new_mg_app/components/get_it_now_animation_component.dart';
import 'package:new_mg_app/pages/campaign_details_page.dart';

class LinkCopyCampaignsComponent extends StatefulWidget {
  final String titulo, data, valor;

  const LinkCopyCampaignsComponent({
    super.key,
    required this.titulo,
    required this.data,
    required this.valor,
  });

  @override
  State<LinkCopyCampaignsComponent> createState() =>
      _LinkCopyCampaignsComponentState();
}

class _LinkCopyCampaignsComponentState
    extends State<LinkCopyCampaignsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://picsum.photos/100/100',
              width: 85,
              height: 95,
              fit: BoxFit.cover,
              cacheWidth: 300,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titulo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "R\$ ${widget.valor}",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 14,
                        color: Color.fromARGB(255, 66, 65, 65),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.data,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 66, 65, 65),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
