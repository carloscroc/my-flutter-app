import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/flutter_flow_theme.dart';

class SavedPageWidget extends StatefulWidget {
  const SavedPageWidget({super.key});

  static String routeName = 'SavedPage';
  static String routePath = '/profile/saved';

  @override
  State<SavedPageWidget> createState() => _SavedPageWidgetState();
}

class _SavedPageWidgetState extends State<SavedPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          'Saved',
          style: FlutterFlowTheme.of(context).paragraphP1SemiBold.copyWith(
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
                  Icons.bookmark_border,
                  size: 80,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                SizedBox(height: 24),
                Text(
                  'Saved Items',
                  style: FlutterFlowTheme.of(context).desktopHeadingH6Bold.copyWith(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                ),
                SizedBox(height: 16),
                Text(
                  'This page is coming soon.\nYou will be able to view your saved workouts and meditations here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).neutral50,
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
