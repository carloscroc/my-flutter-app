import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'ProfilePage';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Porfile',
            style: FlutterFlowTheme.of(context).paragraphP1SemiBold.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontStyle: FlutterFlowTheme.of(context)
                        .paragraphP1SemiBold
                        .fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context)
                      .paragraphP1SemiBold
                      .fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context)
                            .desktopHeadingH6Bold
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .desktopHeadingH6Bold
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .desktopHeadingH6Bold
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).darkMode800,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                  PersonalDetailsPageWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kprofileOutline,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          PersonalDetailsPageWidget.routeName);
                                    },
                                    child: Text(
                                      'Personal Details',
                                      style: FlutterFlowTheme.of(context)
                                          .mobileHeadingH6Medium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .mobileHeadingH6Medium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .neutral50,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: FlutterFlowTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(ActivityPageWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kactivity,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          ActivityPageWidget.routeName);
                                    },
                                    child: Text(
                                      'Activity',
                                      style: FlutterFlowTheme.of(context)
                                          .mobileHeadingH6Medium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .mobileHeadingH6Medium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .neutral50,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: FlutterFlowTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(SavedPageWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.ksaved,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Text(
                                    'Saved',
                                    style: FlutterFlowTheme.of(context)
                                        .mobileHeadingH6Medium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .neutral50,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: FlutterFlowTheme.of(context).darkMode600,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.knotification,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Notifications',
                                  style: FlutterFlowTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: FlutterFlowTheme.of(context).darkMode600,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kworkoutOutline,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Workout Preferences',
                                  style: FlutterFlowTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: FlutterFlowTheme.of(context).darkMode600,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kdiet,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Diet Preferences',
                                  style: FlutterFlowTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: FlutterFlowTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                  AccountSettingsPageWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.ksetting,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Text(
                                    'Account Settings',
                                    style: FlutterFlowTheme.of(context)
                                        .mobileHeadingH6Medium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .neutral50,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                        ].divide(SizedBox(height: 14)),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).darkMode800,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.khelp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Help and Support',
                                  style: FlutterFlowTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: FlutterFlowTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  OnboardingPageWidget.routeName,
                                  context.mounted);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.koutline,
                                  color: FlutterFlowTheme.of(context).error300,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Text(
                                    'Log Out',
                                    style: FlutterFlowTheme.of(context)
                                        .mobileHeadingH6Medium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .error300,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                        ].divide(SizedBox(height: 14)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 24)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
