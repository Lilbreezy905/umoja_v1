import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({
    super.key,
  });

  @override
  ConsumerState<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<ReportScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundData = Theme.of(context).colorScheme.background;
    final textSytle = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      backgroundColor: backgroundData,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Report Video",
          style: textSytle!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: size.width * 0.85,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      fillColor: backgroundData,
                      iconColor: backgroundData,
                      focusColor: backgroundData,
                      hintText: 'Why do you want to report',
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.done))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Report",
                style: textSytle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
