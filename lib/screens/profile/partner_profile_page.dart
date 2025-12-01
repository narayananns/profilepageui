import 'package:flutter/material.dart';
import 'package:profilepageui/providers/partner_provider.dart';
import 'package:provider/provider.dart';
import '../../config/app_colors.dart';
import '../../providers/theme_provider.dart';
import 'widgets/menu_card.dart';
import 'widgets/profile_header.dart';

class PartnerProfilePage extends StatelessWidget {
  const PartnerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PartnerProvider>(context);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    Future<void> _refreshData() async {
      // Call your provider method to refresh data
      await provider
          .refreshPartner(); // Example method, adjust according to your provider
    }

    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: _bottomNav(context),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          color: AppColors.primary,
          child: SingleChildScrollView(
            physics:
                const AlwaysScrollableScrollPhysics(), // Required for RefreshIndicator
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// Profile Section
                ProfileHeader(
                  name: provider.partner.storeName,
                  image: provider.partner.profileImage,
                ),

                const SizedBox(height: 30),

                /// Menu Grid
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.1,
                  ),
                  children: [
                    MenuCard(
                      title: "My Orders",
                      icon: Icons.shopping_cart,
                      showDot: true,
                      // navigateTo: const MyOrdersPage(), // replace with your page
                    ),
                    MenuCard(
                      title: "Store Timings",
                      icon: Icons.access_time,
                      // navigateTo: const StoreTimingsPage(),
                    ),
                    MenuCard(
                      title: "Store Document",
                      icon: Icons.insert_drive_file,
                      // navigateTo: const StoreDocumentPage(),
                    ),
                    MenuCard(
                      title: "Store Bank Details",
                      icon: Icons.account_balance_wallet,
                      showDot: true,
                      // navigateTo: const BankDetailsPage(),
                    ),
                    MenuCard(
                      title: "My Payments",
                      icon: Icons.payments,
                      showDot: true,
                      // navigateTo: const PaymentsPage(),
                    ),
                    MenuCard(
                      title: "Monthly Invoice",
                      icon: Icons.receipt_long,
                      // navigateTo: const InvoicePage(),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// Logout Button
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: isDark ? Colors.black : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 10,
      centerTitle: true,
      title: const Text("Profile", style: TextStyle(fontSize: 18)),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
      ),
      actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            final isDark = themeProvider.isDark;

            return IconButton(
              onPressed: () => themeProvider.toggleTheme(),
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).iconTheme.color,
              ),
              tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            );
          },
        ),
      ],
    );
  }

Widget _bottomNav(BuildContext context) {
  return BottomNavigationBar(
    currentIndex: 2,
    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    selectedItemColor: Colors.blue,
    unselectedItemColor:
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Analytics"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  );
}

}
