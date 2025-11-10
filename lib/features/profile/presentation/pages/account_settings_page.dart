import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';

class AccountSettingsPageWidget extends StatefulWidget {
  const AccountSettingsPageWidget({super.key});

  static String routeName = 'AccountSettingsPage';
  static String routePath = '/profile/account-settings';

  @override
  State<AccountSettingsPageWidget> createState() =>
      _AccountSettingsPageWidgetState();
}

class _AccountSettingsPageWidgetState
    extends State<AccountSettingsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          'Account Settings',
          style: AppTheme.of(context).paragraphP1SemiBold.copyWith(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings_outlined,
                  size: 80,
                  color: AppTheme.of(context).primary,
                ),
                SizedBox(height: 24),
                Text(
                  'Account Settings',
                  style: AppTheme.of(context).desktopHeadingH6Bold.copyWith(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                ),
                SizedBox(height: 16),
                Text(
                  'This page is coming soon.\nYou will be able to manage your account settings, change password, and more here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.of(context).neutral50,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
