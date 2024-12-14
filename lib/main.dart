import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_font_bold_issue/ofl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    yield const LicenseEntryWithLineBreaks(['google_fonts'], notoSansJp);
  });

  unawaited(
    GoogleFonts.pendingFonts([
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w100),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w200),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w300),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w400),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w500),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w600),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w700),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w800),
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w900),
    ]),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SytemFonts test',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const textEn = 'Seeing is believing';
    const textJp = '百聞は一見にしかず';

    const items = [
      ('w100', FontWeight.w100),
      ('w200', FontWeight.w200),
      ('w300', FontWeight.w300),
      ('w400', FontWeight.w400),
      ('w500', FontWeight.w500),
      ('w600', FontWeight.w600),
      ('w700', FontWeight.w700),
      ('w800', FontWeight.w800),
      ('w900', FontWeight.w900),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('SystemFonts test'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showLicensePage(
                context: context,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('FontWeight')),
              DataColumn(label: Expanded(child: Text('SystemFonts'))),
              DataColumn(label: Expanded(child: Text('SystemFonts'))),
              DataColumn(label: Expanded(child: Text('GoogleFonts'))),
              DataColumn(label: Expanded(child: Text('GoogleFonts'))),
            ],
            rows: [
              for (final item in items)
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        item.$1,
                        style: TextStyle(
                          fontWeight: item.$2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        textEn,
                        style: TextStyle(
                          fontWeight: item.$2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        textJp,
                        style: TextStyle(
                          fontWeight: item.$2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        textEn,
                        style: GoogleFonts.notoSansJp(
                          fontWeight: item.$2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        textJp,
                        style: GoogleFonts.notoSansJp(
                          fontWeight: item.$2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
