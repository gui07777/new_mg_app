class Purchase {
  final String name;
  final String phone;
  final String date;
  final String value;
  final String status;
  final String quantity;
  final List<int> tickets;

  Purchase.fromJson(Map<String, dynamic> json)
    : name = json['client']?['name'] ?? 'Nome Indisponível',
      phone = json['client']?['phone'] ?? 'Telefone Indisponível',
      date = json['createdAt'] ?? '',
      value = json['total']?.toString() ?? '0.00',
      status = json['status'] == 'CONFIRMED'
          ? 'Confirmado'
          : (json['status'] ?? ''),
      quantity = json['quantityTickets']?.toString() ?? '0',
      tickets = List<int>.from(json['tickets'] ?? []);
}
