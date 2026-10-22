import '../../api/enums.dart';
import 'package:flutter/widgets.dart';

import 'common.dart';
import '../../l10n/l10n.dart';

/// Status pill for transactions.
class TxStatusPill extends StatelessWidget {
  const TxStatusPill({super.key, required this.status});
  final TransactionStatus status;

  @override
  Widget build(BuildContext context) {
    final (kind, label) = switch (status) {
      TransactionStatus.completed => (PillKind.success, l10n.commonEffectue),
      TransactionStatus.pending => (PillKind.pending, l10n.commonAttente),
      TransactionStatus.authorized => (PillKind.info, l10n.commonAutorise),
      TransactionStatus.declined => (PillKind.declined, l10n.commonRefuse),
      TransactionStatus.reversed => (PillKind.warn, l10n.commonAnnule),
      TransactionStatus.unknown => (PillKind.neutral, '—'),
    };
    return StatusPill(label: label, kind: kind);
  }
}

/// Card status pill.
class CardStatusPill extends StatelessWidget {
  const CardStatusPill({super.key, required this.status});
  final CardStatus status;

  @override
  Widget build(BuildContext context) {
    final kind = switch (status) {
      CardStatus.active => PillKind.success,
      CardStatus.issued => PillKind.info,
      CardStatus.blocked => PillKind.warn,
      CardStatus.lost || CardStatus.stolen => PillKind.declined,
      CardStatus.expired || CardStatus.closed => PillKind.pending,
      CardStatus.unknown => PillKind.neutral,
    };
    return StatusPill(label: status.label, kind: kind);
  }
}

/// Card-stock status pill.
class StockStatusPill extends StatelessWidget {
  const StockStatusPill({super.key, required this.status});
  final CardStockStatus status;

  @override
  Widget build(BuildContext context) {
    final kind = switch (status) {
      CardStockStatus.assignedToAgent => PillKind.info,
      CardStockStatus.sold => PillKind.success,
      CardStockStatus.spoiled => PillKind.declined,
      CardStockStatus.returned => PillKind.warn,
      CardStockStatus.inWarehouse => PillKind.pending,
      CardStockStatus.unknown => PillKind.neutral,
    };
    return StatusPill(label: status.label, kind: kind);
  }
}

/// Commission payout status pill.
class PayoutStatusPill extends StatelessWidget {
  const PayoutStatusPill({super.key, required this.status});
  final PayoutStatus status;

  @override
  Widget build(BuildContext context) {
    final kind = switch (status) {
      PayoutStatus.paid => PillKind.success,
      PayoutStatus.pending => PillKind.pending,
      PayoutStatus.failed => PillKind.declined,
      PayoutStatus.cancelled => PillKind.warn,
      PayoutStatus.unknown => PillKind.neutral,
    };
    return StatusPill(label: status.label, kind: kind);
  }
}

/// Generic actor/customer status pill (active/suspended/etc).
class GenericStatusPill extends StatelessWidget {
  const GenericStatusPill({
    super.key,
    required this.label,
    required this.active,
  });
  final String label;
  final bool active;
  @override
  Widget build(BuildContext context) =>
      StatusPill(label: label, kind: active ? PillKind.success : PillKind.warn);
}
