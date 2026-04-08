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
      date = _formatDate(json['createdAt']),
      value = json['total']?.toString() ?? '0.00',
      status = _translateStatus(json['status']),
      quantity = json['quantityTickets']?.toString() ?? '0',
      tickets = List<int>.from(json['tickets'] ?? []);

  static String _formatDate(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return '';

    try {
      DateTime parsedDate = DateTime.parse(
        rawDate,
      ); // 2023-10-27 10:00:00.000 (exemplo)
      parsedDate = parsedDate.toLocal(); // fuso horario local

      String day = parsedDate.day.toString().padLeft(2, '0');
      String month = parsedDate.month.toString().padLeft(2, '0');
      String year = parsedDate.year.toString();
      String hour = parsedDate.hour.toString().padLeft(2, '0');
      String minute = parsedDate.minute.toString().padLeft(2, '0');

      return '$day/$month/$year - $hour:${minute}h';
    } catch (e) {
      return rawDate;
    }
  }

  static _translateStatus(String returnedStatus) {
    if (returnedStatus.isEmpty) return;

    switch (returnedStatus) {
      case 'CONFIRMED':
        return 'Confirmado';
      case 'PENDING':
        return 'Pendente';
      default:
        returnedStatus;
    }
  }
}
