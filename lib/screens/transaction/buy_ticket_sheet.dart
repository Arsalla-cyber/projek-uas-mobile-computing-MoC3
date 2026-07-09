import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../data/dummy_data.dart';
import '../../widgets/smart_image.dart';

/// Dipanggil dari Detail Movie (Orang 2) via:
/// showModalBottomSheet(context: context, isScrollControlled: true,
///   builder: (_) => BuyTicketSheet(movie: movie, cinema: cinema));
class BuyTicketSheet extends StatefulWidget {
  final Movie movie;
  final Cinema cinema;

  const BuyTicketSheet({super.key, required this.movie, required this.cinema});

  @override
  State<BuyTicketSheet> createState() => _BuyTicketSheetState();
}

class _BuyTicketSheetState extends State<BuyTicketSheet> {
  // State UI murni (bukan business logic) — boleh dipakai langsung.
  int _selectedDateIndex = 0;
  int _selectedTimeIndex = 2;
  int _ticketCount = 2;

  final List<Map<String, String>> _dates = const [
    {'day': 'MON', 'date': '22'},
    {'day': 'TUE', 'date': '23'},
    {'day': 'WED', 'date': '24'},
    {'day': 'THU', 'date': '25'},
  ];

  final List<String> _times = const ['11:00', '14:00', '17:30', '20:00', '22:45'];

  static const double _pricePerTicket = 18000;

  double get _totalPrice => _pricePerTicket * _ticketCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Info film + cinema
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 60,
                    height: 84,
                    child: SmartImage(
                      path: widget.movie.poster,
                      placeholderIcon: Icons.movie,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.white38, size: 13),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              widget.cinema.name,
                              style: const TextStyle(
                                  color: Colors.white54, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.movie.durationLabel.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white54, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text('Select Date',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: List.generate(_dates.length, (i) {
                final selected = i == _selectedDateIndex;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedDateIndex = i),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFFE31E24)
                            : const Color(0xFF1F1F1F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(_dates[i]['day']!,
                              style: TextStyle(
                                  color: selected
                                      ? Colors.white70
                                      : Colors.white38,
                                  fontSize: 10)),
                          const SizedBox(height: 2),
                          Text(_dates[i]['date']!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 22),

            const Text('Showtime',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(_times.length, (i) {
                final selected = i == _selectedTimeIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTimeIndex = i),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFFE31E24)
                          : const Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(_times[i],
                        style: TextStyle(
                            color: selected ? Colors.white : Colors.white70,
                            fontWeight: FontWeight.w600)),
                  ),
                );
              }),
            ),
            const SizedBox(height: 22),

            // Tickets stepper
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tickets',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      _StepperButton(
                        icon: Icons.remove,
                        onTap: () {
                          if (_ticketCount > 1) {
                            setState(() => _ticketCount--);
                          }
                        },
                      ),
                      SizedBox(
                        width: 36,
                        child: Text(
                          '$_ticketCount',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _StepperButton(
                        icon: Icons.add,
                        onTap: () => setState(() => _ticketCount++),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Total + confirm
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('TOTAL PRICE',
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 11,
                              letterSpacing: 1)),
                      Text(
                        '\$${_totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 1. Buat objek Ticket baru dari pilihan user.
                    final selectedDate = _dates[_selectedDateIndex];
                    final newTicket = Ticket(
                      id: 't-${DateTime.now().millisecondsSinceEpoch}',
                      movie: widget.movie,
                      cinema: widget.cinema,
                      date: '${selectedDate['day']} ${selectedDate['date']}',
                      time: _times[_selectedTimeIndex],
                      seatCount: _ticketCount,
                      totalPrice: _totalPrice,
                      status: 'Upcoming',
                    );

                    // 2. Tambahkan ke riwayat (in-memory, paling atas list).
                    dummyTickets.insert(0, newTicket);

                    // 3. Tutup sheet.
                    Navigator.pop(context);

                    // 4. Beri konfirmasi ke user.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Tiket "${widget.movie.title}" berhasil dipesan!',
                        ),
                        backgroundColor: const Color(0xFFE31E24),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE31E24),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Confirm Booking',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Color(0xFF2E2E2E),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}
