import 'package:flutter/material.dart';
import '../../../data/dummy_data.dart';
import '../../../models/models.dart';
import '../../../widgets/smart_image.dart';

/// Diakses dari menu "Purchase History" di halaman Profil (Orang 1).
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'CINEGO',
                    style: TextStyle(
                      color: Color(0xFFE31E24),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.search, color: Colors.white70),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'PURCHASE\nHISTORY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Review your past and upcoming cinematic experiences.',
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ],
              ),
            ),
            Expanded(
              child: dummyTickets.isEmpty
                  ? const _EmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: dummyTickets.length,
                      itemBuilder: (context, index) {
                        return _TicketHistoryCard(ticket: dummyTickets[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TicketHistoryCard extends StatelessWidget {
  final Ticket ticket;
  const _TicketHistoryCard({required this.ticket});

  @override
  Widget build(BuildContext context) {
    final isUpcoming = ticket.status == 'Upcoming';

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF161616),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 56,
              height: 80,
              child: SmartImage(
                path: ticket.movie.poster,
                placeholderIcon: Icons.movie,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        ticket.movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: isUpcoming
                            ? const Color(0xFFF5C518).withOpacity(0.15)
                            : Colors.white12,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isUpcoming
                              ? const Color(0xFFF5C518)
                              : Colors.white24,
                        ),
                      ),
                      child: Text(
                        ticket.status,
                        style: TextStyle(
                          color: isUpcoming
                              ? const Color(0xFFF5C518)
                              : Colors.white54,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.theaters, color: Colors.white38, size: 13),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        ticket.cinema.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        color: Colors.white38, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      '${ticket.date} • ${ticket.time}',
                      style: const TextStyle(
                          color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
                if (isUpcoming) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () => _showTicketDetail(context, ticket),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE31E24),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('View Ticket',
                          style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTicketDetail(BuildContext context, Ticket ticket) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: const Color(0xFF161616),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(ticket.cinema.name,
                  style: const TextStyle(color: Colors.white54, fontSize: 13)),
              const Divider(color: Colors.white12, height: 28),
              _DetailRow(label: 'Tanggal', value: ticket.date),
              _DetailRow(label: 'Jam', value: ticket.time),
              _DetailRow(label: 'Jumlah Tiket', value: '${ticket.seatCount}'),
              _DetailRow(
                  label: 'Total Bayar',
                  value: '\$${ticket.totalPrice.toStringAsFixed(2)}'),
              const SizedBox(height: 20),
              // Placeholder QR code sederhana (dummy, bukan QR asli).
              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: const Icon(Icons.qr_code_2,
                      size: 100, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE31E24),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 13)),
          Text(value,
              style: const TextStyle(
                  color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.confirmation_number_outlined,
              color: Colors.white24, size: 48),
          const SizedBox(height: 12),
          const Text(
            'Belum ada riwayat pembelian',
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
