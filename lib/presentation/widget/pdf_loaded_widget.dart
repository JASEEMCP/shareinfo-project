import 'package:shareinfo/presentation/core/common_lib.dart';

class PdfLoadedSkeltonWidget extends StatelessWidget {
  const PdfLoadedSkeltonWidget({
    super.key,
    this.onTap,
    this.onRemove,
    required this.documentName,
    required this.fileSize,
  });
  final String documentName;
  final String fileSize;
  final Function? onTap;
  final Function? onRemove;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;

    return GestureDetector(
      onTap: () {
        onTap != null ? onTap!() : () {};
      },
      child: Container(
        //margin: EdgeInsets.all(inset.md),
        decoration: BoxDecoration(
          color: context.theme.statusRed.withOpacity(0.1),
          borderRadius: BorderRadius.circular(inset.md),
          boxShadow: [
            BoxShadow(
              color: context.theme.statusRed,
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: context.theme.statusRed,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: inset.md),
          dense: true,
          leading: Icon(
            Icons.document_scanner_rounded,
            color: context.theme.shareinfoRed,
          ),
          title: Text(
            documentName,
            style: style.textBold12,
          ),
          subtitle: Text(
            fileSize,
            style: style.textSBold10,
          ),
          trailing: IconButton(
            onPressed: () {
              onRemove != null ? onRemove!() : () {};
            },
            icon: Icon(Icons.close, color: context.theme.shareinfoRed),
          ),
        ),
      ),
    );
  }
}

class PdfLoadedSkeltonWidgetDemo extends StatelessWidget {
  const PdfLoadedSkeltonWidgetDemo({
    super.key,
    this.onTap,
    this.onRemove,
    required this.documentName,
    required this.fileSize,
  });
  final String documentName;
  final String fileSize;
  final Function? onTap;
  final Function? onRemove;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;

    return GestureDetector(
      onTap: () {
        onTap != null ? onTap!() : () {};
      },
      child: Container(
        //margin: EdgeInsets.all(inset.md),
        decoration: BoxDecoration(
          color: context.theme.statusRed.withOpacity(0.1),
          borderRadius: BorderRadius.circular(inset.md),
          boxShadow: [
            BoxShadow(
              color: context.theme.statusRed,
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: context.theme.statusRed,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: inset.md, vertical: inset.xs),
          dense: true,
          leading: Icon(
            Icons.document_scanner_rounded,
            color: context.theme.shareinfoRed,
          ),
          title: Text(
            documentName,
            style: style.textBold12,
          ),
        ),
      ),
    );
  }
}

class DownloadingDocumentWidget extends StatelessWidget {
  const DownloadingDocumentWidget({
    super.key,
    this.documentName,
    this.fileSize,
    required this.downloadPercentage,
  });
  final String? documentName;
  final String? fileSize;
  final double downloadPercentage;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.shareinfoWhite,
          borderRadius: BorderRadius.circular(inset.lg),
          boxShadow: [
            BoxShadow(
              color: context.theme.statusRed,
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: context.theme.shareinfoRed,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: inset.md, vertical: inset.xs),
              dense: true,
              leading: Icon(
                Icons.document_scanner_rounded,
                color: context.theme.statusRed,
              ),
              title: Text(
                documentName ?? '',
                style: style.textBold12,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 65,
              width: downloadPercentage * context.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(inset.lg),
                color: const Color.fromARGB(82, 230, 181, 179),
              ),
            )
          ],
        ),
      ),
    );
  }
}
