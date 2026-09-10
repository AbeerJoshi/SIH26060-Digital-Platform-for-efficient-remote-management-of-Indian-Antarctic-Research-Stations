import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/pill_field.dart';
import '../hq/hq_dashboard_screen.dart';
import '../base/base_dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _showDevelopersDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'By the joint efforts of Arch_Larpers_404',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
        content: const Text(
          'Abeer Joshi (Lead), Srijan Sachan, Raksha Gupta, Kritika Madan, Shubh Arora, Lakshika Bangari',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CLOSE', style: TextStyle(color: AppColors.barFill)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: Column(
                children: [
                  const Text(
                    'HEIMDALL',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Empowering National Polar Researches',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 56),
                  Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: [
                      _LoginCard(
                        icon: Icons.science_outlined,
                        fieldOneHint: 'Researcher (Ex. BH744 or MT839)',
                        label: 'BASE\nINTERFACE',
                        onSubmit: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const BaseDashboardScreen()),
                        ),
                      ),
                      _LoginCard(
                        icon: Icons.apartment_outlined,
                        fieldOneHint: 'Executive Credentials',
                        label: 'HEADQUARTER\nINTERFACE',
                        onSubmit: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const HqDashboardScreen()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 24,
            child: TextButton(
              onPressed: () => _showDevelopersDialog(context),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.cardBackgroundAlt,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                'Developers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The Figma frame shows no explicit submit button, so the whole card
/// (outside the two text fields) doubles as the login trigger — tap it
/// with any text in the fields, or none at all, and it routes through.
class _LoginCard extends StatefulWidget {
  final IconData icon;
  final String fieldOneHint;
  final String label;
  final VoidCallback onSubmit;

  const _LoginCard({
    required this.icon,
    required this.fieldOneHint,
    required this.label,
    required this.onSubmit,
  });

  @override
  State<_LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: widget.onSubmit,
        child: Container(
          width: 340,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            children: [
              Icon(widget.icon, size: 56, color: AppColors.textPrimary),
              const SizedBox(height: 32),
              PillField(hint: widget.fieldOneHint, controller: _userCtrl),
              const SizedBox(height: 16),
              PillField(hint: 'Password', controller: _passCtrl, obscure: true),
              const SizedBox(height: 56),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}