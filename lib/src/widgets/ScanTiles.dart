import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:qr_scan_flutter/src/provider/ScanListProvider.dart';
import 'package:qr_scan_flutter/src/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({super.key, required this.type, required this.icon});
  final ScanType type;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final scanList = Provider.of<ScanListProvider>(context);
    final scans = scanList.scans;
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: scans.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Icon(
                // Icons.http_sharp,
                icon,
                color: Colors.white,
              ),
              title: Text(scans[index].value),
              subtitle: Text(scans[index].type.toString()),
              trailing: const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.grey,
              ),
              onTap: () => Utils().canLaunchUrl(Uri.parse(scans[index].value),
                  scans[index].type, context, scans[index]),
            ));
  }
}
