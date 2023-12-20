import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bus_ticket_booking_screen.dart';
import 'user_tickets_screen.dart';

final pageControllerProvider = Provider<PageController>((ref) {
  return PageController(initialPage: 0);
});

class BusTicketsScreen extends ConsumerStatefulWidget {
  const BusTicketsScreen({super.key});

  @override
  ConsumerState<BusTicketsScreen> createState() => _BusTicketsScreenState();
}

class _BusTicketsScreenState extends ConsumerState<BusTicketsScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(pageControllerProvider);

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tickets'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: theme.colorScheme.primary.withOpacity(0.2),
            ),
            indicatorPadding: const EdgeInsets.all(4),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                child: Text("Book Tickets"),
              ),
              Tab(
                child: Text("My Tickets"),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                indexNotifier.value = value;
              },
              children: const [
                TicketBookingScreen(),
                UserTicketsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
