import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A small, editable playground for testing background images/SVGs.
///
/// Edit the `examples` list below to add more assets. This file is
/// intentionally self-contained so you can iterate quickly.
///
/// Also exposes `TestBackground` — a simple gradient background widget
/// that other screens can reuse during development.
class TestBackground extends StatelessWidget {
  final double opacity;
  const TestBackground({Key? key, this.opacity = 1.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2F80ED), Color(0xFF24C4A8), Color(0xFF9BE15D)],
          ),
        ),
      ),
    );
  }
}
class UIBackgroundTest extends StatefulWidget {
  const UIBackgroundTest({Key? key}) : super(key: key);

  @override
  State<UIBackgroundTest> createState() => _UIBackgroundTestState();
}

class _UIBackgroundTestState extends State<UIBackgroundTest> {
  // Add asset paths here to cycle through examples. Edit this list often.
  final List<String> examples = [
    'assets/images/fitness-gradient.svg',
  ];

  int index = 0;
  double opacity = 1.0;
  BoxFit fit = BoxFit.cover;
  Alignment alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Background Test'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 200),
                    child: _buildBackground(examples[index]),
                  ),
                ),
                // Foreground preview content so you can see overlays and
                // spacing while the background is visible.
                Positioned.fill(
                  child: SafeArea(
                    child: Center(
                      child: Text(
                        'Example ${index + 1} / ${examples.length}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildBackground(String path) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        fit: fit,
        alignment: alignment,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Image.asset(
      path,
      fit: fit,
      alignment: alignment,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () => setState(() => index = (index - 1 + examples.length) % examples.length),
                child: const Text('Prev'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => setState(() => index = (index + 1) % examples.length),
                child: const Text('Next'),
              ),
              const Spacer(),
              const Text('Opacity', style: TextStyle(fontSize: 12)),
              const SizedBox(width: 8),
              SizedBox(
                width: 150,
                child: Slider(value: opacity, min: 0, max: 1, onChanged: (v) => setState(() => opacity = v)),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Fit:'),
              const SizedBox(width: 8),
              DropdownButton<BoxFit>(
                value: fit,
                items: <BoxFit>[BoxFit.cover, BoxFit.contain, BoxFit.fill, BoxFit.scaleDown, BoxFit.fitWidth, BoxFit.fitHeight]
                    .map((b) => DropdownMenuItem(value: b, child: Text(b.toString().split('.').last)))
                    .toList(),
                onChanged: (v) => setState(() => fit = v ?? BoxFit.cover),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => setState(() => alignment = alignment == Alignment.center ? Alignment.topCenter : Alignment.center),
                child: const Text('Toggle Align'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
