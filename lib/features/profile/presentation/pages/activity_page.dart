import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/flutter_flow_theme.dart';

class ActivityPageWidget extends StatefulWidget {
  const ActivityPageWidget({super.key});

  static String routeName = 'ActivityPage';
  static String routePath = '/profile/activity';

  @override
  State<ActivityPageWidget> createState() => _ActivityPageWidgetState();
}

class _ActivityPageWidgetState extends State<ActivityPageWidget> {
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
          'Activity',
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
                  Icons.show_chart,
                  size: 80,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                SizedBox(height: 24),
                Text(
                  'Activity',
                  style: FlutterFlowTheme.of(context).desktopHeadingH6Bold.copyWith(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                ),
                SizedBox(height: 16),
                Text(
                  'This page is coming soon.\nYou will be able to view your activity history and statistics here.',
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
