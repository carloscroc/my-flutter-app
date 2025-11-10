import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';

class PersonalDetailsPageWidget extends StatefulWidget {
  const PersonalDetailsPageWidget({super.key});

  static String routeName = 'PersonalDetailsPage';
  static String routePath = '/profile/personal-details';

  @override
  State<PersonalDetailsPageWidget> createState() =>
      _PersonalDetailsPageWidgetState();
}

class _PersonalDetailsPageWidgetState
    extends State<PersonalDetailsPageWidget> {
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
          'Personal Details',
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
                  Icons.person_outline,
                  size: 80,
                  color: AppTheme.of(context).primary,
                ),
                SizedBox(height: 24),
                Text(
                  'Personal Details',
                  style: AppTheme.of(context).desktopHeadingH6Bold.copyWith(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                ),
                SizedBox(height: 16),
                Text(
                  'This page is coming soon.\nYou will be able to view and edit your personal information here.',
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
