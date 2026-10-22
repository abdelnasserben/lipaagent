import '../../api/enums.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'formatters.dart';
import '../../l10n/l10n.dart';

/// Builds the share/PDF artefacts for an agent transaction receipt and the
/// account statement. Pure presentation logic so the activity detail and the
/// statement screen reuse the exact same rendering. Mirrors the Lipa customer
/// app's `transaction_receipt.dart`, adapted to the agent's account-scoped
/// [AgentTransactionResponse] / [AgentStatementEntryResponse] models.

/// PDF theme backed by a real TrueType font. The default PDF font (Helvetica)
/// lacks the Unicode minus sign U+2212 used in amounts (it renders as a missing
/// glyph / tofu box), so we use Open Sans, shipped in assets/fonts: receipts
/// work offline.
Future<pw.ThemeData> _pdfTheme() async => pw.ThemeData.withFont(
  base: pw.Font.ttf(await rootBundle.load('assets/fonts/OpenSans-Regular.ttf')),
  bold: pw.Font.ttf(await rootBundle.load('assets/fonts/OpenSans-Bold.ttf')),
);

/// Status label, matching `TxStatusPill`.
String _statusLabelFr(TransactionStatus s) => switch (s) {
  TransactionStatus.completed => l10n.commonEffectue,
  TransactionStatus.pending => l10n.commonAttente,
  TransactionStatus.authorized => l10n.commonAutorise,
  TransactionStatus.declined => l10n.commonRefuse,
  TransactionStatus.reversed => l10n.commonAnnule,
  TransactionStatus.unknown => '—',
};

/// A plain-text recap suitable for the native share sheet.
String receiptShareText(AgentTransactionResponse t) {
  final incoming = t.incoming;
  final sign = incoming ? '+' : '−';
  final at = t.effectiveAt;
  final lines = <String>[
    'Reçu Lipa',
    '',
    l10n.transactionReceiptOperation(t.kind.label),
    l10n.transactionReceiptMontantKmf(
      sign,
      fmtKmfNoUnit(t.requestedAmount ?? 0),
    ),
    l10n.transactionReceiptStatut(_statusLabelFr(t.state)),
    if (at != null) l10n.transactionReceiptDate(fmtDateTimeFr(at)),
    if ((t.feeAmount ?? 0) > 0)
      l10n.transactionReceiptFraisKmf(fmtKmfNoUnit(t.feeAmount ?? 0)),
    if ((t.commissionAmount ?? 0) > 0)
      l10n.transactionReceiptCommissionKmf(
        fmtKmfNoUnit(t.commissionAmount ?? 0),
      ),
    l10n.transactionReceiptMontantNetKmf(
      fmtKmfNoUnit(t.netAmountToDestination ?? 0),
    ),
    l10n.transactionReceiptReference(t.id ?? ''),
  ];
  return lines.join('\n');
}

/// Renders the agent receipt as a printable/shareable PDF document.
Future<Uint8List> receiptPdfBytes(AgentTransactionResponse t) async {
  final doc = pw.Document(theme: await _pdfTheme());
  final incoming = t.incoming;
  final sign = incoming ? '+' : '−';
  final at = t.effectiveAt;

  const ink = PdfColor.fromInt(0xFF171717);
  const inkMid = PdfColor.fromInt(0xFF5A5852);
  const inkLow = PdfColor.fromInt(0xFF8A8780);
  const brand = PdfColor.fromInt(0xFF386851);
  const line = PdfColor.fromInt(0xFFE6E3DC);

  pw.Widget row(
    String label,
    String value, {
    bool last = false,
  }) => pw.Container(
    padding: const pw.EdgeInsets.symmetric(vertical: 10),
    decoration: last
        ? null
        : const pw.BoxDecoration(
            border: pw.Border(bottom: pw.BorderSide(color: line, width: 0.8)),
          ),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(label, style: const pw.TextStyle(color: inkMid, fontSize: 11)),
        pw.SizedBox(width: 24),
        pw.Expanded(
          child: pw.Text(
            value,
            textAlign: pw.TextAlign.right,
            style: const pw.TextStyle(color: ink, fontSize: 11),
          ),
        ),
      ],
    ),
  );

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(40, 48, 40, 48),
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            l10n.commonLipa,
            style: pw.TextStyle(
              color: brand,
              fontSize: 22,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 2),
          pw.Text(
            l10n.transactionReceiptRecuTransaction,
            style: const pw.TextStyle(color: inkLow, fontSize: 12),
          ),
          pw.SizedBox(height: 28),
          pw.Text(
            t.kind.label,
            style: pw.TextStyle(
              color: ink,
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 18),
          pw.Text(
            '$sign${fmtKmfNoUnit(t.requestedAmount ?? 0)} KMF',
            style: pw.TextStyle(
              color: ink,
              fontSize: 30,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 28),
          row(l10n.commonStatut2, _statusLabelFr(t.state)),
          if (at != null) row(l10n.transactionReceiptDate2, fmtDateTimeFr(at)),
          row(l10n.commonType, t.kind.label),
          if ((t.feeAmount ?? 0) > 0)
            row(l10n.commonFrais, '${fmtKmfNoUnit(t.feeAmount ?? 0)} KMF'),
          if ((t.commissionAmount ?? 0) > 0)
            row(
              l10n.commonCommission,
              '${fmtKmfNoUnit(t.commissionAmount ?? 0)} KMF',
            ),
          row(
            l10n.transactionReceiptMontantNet,
            '${fmtKmfNoUnit(t.netAmountToDestination ?? 0)} KMF',
          ),
          row(l10n.transactionReceiptReference2, t.id ?? '', last: true),
          pw.Spacer(),
          pw.Text(
            l10n.transactionReceiptRecuGenereApplicationLipa,
            style: const pw.TextStyle(color: inkLow, fontSize: 9),
          ),
        ],
      ),
    ),
  );

  return doc.save();
}

/// Renders a account statement (a date window's entries with running balance)
/// as a printable/shareable PDF. [from]/[to] are the chosen window, null = all.
Future<Uint8List> statementPdfBytes(
  List<AgentStatementEntryResponse> entries, {
  DateTime? from,
  DateTime? to,
}) async {
  final doc = pw.Document(theme: await _pdfTheme());

  const ink = PdfColor.fromInt(0xFF171717);
  const inkMid = PdfColor.fromInt(0xFF5A5852);
  const inkLow = PdfColor.fromInt(0xFF8A8780);
  const brand = PdfColor.fromInt(0xFF386851);
  const credit = PdfColor.fromInt(0xFF386851);
  const line = PdfColor.fromInt(0xFFE6E3DC);
  const headerBg = PdfColor.fromInt(0xFFF1EFE8);

  final period = (from == null && to == null)
      ? l10n.commonToutePeriode
      : '${from != null ? fmtDateTimeFr(from) : '…'} → '
            '${to != null ? fmtDateTimeFr(to) : '…'}';

  pw.Widget cell(
    String text, {
    pw.TextAlign align = pw.TextAlign.left,
    PdfColor color = ink,
    bool bold = false,
  }) => pw.Text(
    text,
    textAlign: align,
    style: pw.TextStyle(
      color: color,
      fontSize: 9,
      fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
    ),
  );

  pw.TableRow headerRow() => pw.TableRow(
    decoration: const pw.BoxDecoration(color: headerBg),
    children: [
      pw.Padding(
        padding: const pw.EdgeInsets.all(6),
        child: cell(l10n.transactionReceiptDate2, bold: true, color: inkMid),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.all(6),
        child: cell(
          l10n.transactionReceiptDescription,
          bold: true,
          color: inkMid,
        ),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.all(6),
        child: cell(
          l10n.commonMontant,
          align: pw.TextAlign.right,
          bold: true,
          color: inkMid,
        ),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.all(6),
        child: cell(
          l10n.transactionReceiptSolde,
          align: pw.TextAlign.right,
          bold: true,
          color: inkMid,
        ),
      ),
    ],
  );

  pw.TableRow entryRow(AgentStatementEntryResponse e) {
    final isCredit = e.entrySide.isCredit;
    return pw.TableRow(
      decoration: const pw.BoxDecoration(
        border: pw.Border(top: pw.BorderSide(color: line, width: 0.6)),
      ),
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(6),
          child: cell(
            e.postedAt != null ? fmtDateTimeFr(e.postedAt!) : '—',
            color: inkMid,
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(6),
          child: cell(e.kind.label),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(6),
          child: cell(
            '${isCredit ? '+' : '−'}${fmtKmfNoUnit(e.amount ?? 0)}',
            align: pw.TextAlign.right,
            color: isCredit ? credit : ink,
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(6),
          child: cell(
            fmtKmfNoUnit(e.runningBalance ?? 0),
            align: pw.TextAlign.right,
            color: inkMid,
          ),
        ),
      ],
    );
  }

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(36, 44, 36, 44),
      header: (context) => context.pageNumber == 1
          ? pw.SizedBox()
          : pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(bottom: 8),
              child: pw.Text(
                l10n.transactionReceiptReleveLipa,
                style: const pw.TextStyle(color: inkLow, fontSize: 9),
              ),
            ),
      footer: (context) => pw.Container(
        alignment: pw.Alignment.centerRight,
        child: pw.Text(
          l10n.transactionReceiptPage(context.pageNumber, context.pagesCount),
          style: const pw.TextStyle(color: inkLow, fontSize: 9),
        ),
      ),
      build: (context) => [
        pw.Text(
          l10n.commonLipa,
          style: pw.TextStyle(
            color: brand,
            fontSize: 22,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          l10n.transactionReceiptReleveCompte,
          style: const pw.TextStyle(color: inkLow, fontSize: 12),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          l10n.transactionReceiptPeriode(period),
          style: const pw.TextStyle(color: inkMid, fontSize: 10),
        ),
        pw.SizedBox(height: 16),
        if (entries.isEmpty)
          pw.Text(
            l10n.transactionReceiptAucuneEcriturePeriode,
            style: const pw.TextStyle(color: inkLow, fontSize: 11),
          )
        else
          pw.Table(
            columnWidths: const {
              0: pw.FlexColumnWidth(2.4),
              1: pw.FlexColumnWidth(3.2),
              2: pw.FlexColumnWidth(2),
              3: pw.FlexColumnWidth(2),
            },
            children: [headerRow(), ...entries.map(entryRow)],
          ),
      ],
    ),
  );

  return doc.save();
}
