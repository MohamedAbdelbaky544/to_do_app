import 'package:flutter/material.dart';
import 'package:to_do_app/core/presentation/themes/app_theme.dart';
import 'package:to_do_app/core/presentation/utils/generated/translation/translations.dart';

class RegularBottomSheetLayout extends StatelessWidget {
  const RegularBottomSheetLayout({
    super.key,
    required this.body,
    this.bodyPadding,
    this.actions,
    this.height,
    this.title,
    this.showDoneBtn = false,
    this.showCancelBtn = false,
    this.enableDrag = true,
    this.doneTxt,
    this.cancelTxt,
    this.onDone,
    this.onCancel,
    this.doneFlex = 5,
    this.cancelFlex = 2,
    this.enableDoneBtn = true,
  });
  final Widget body;
  final EdgeInsets? bodyPadding;
  final List<Widget>? actions;
  final double? height;
  final String? title;
  final bool showDoneBtn;
  final bool showCancelBtn;
  final bool enableDrag;
  final String? doneTxt;
  final String? cancelTxt;
  final void Function()? onDone;
  final void Function()? onCancel;
  final int doneFlex;
  final int cancelFlex;
  final bool enableDoneBtn;

  @override
  Widget build(BuildContext context) {
    Translations tr = Translations.of(context)!;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: height ?? MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: bodyPadding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Theme.of(context).appColors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (title != null)
                  Text(
                    title!,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                if (actions != null) Row(children: actions!)
              ],
            ),
          ),
          Expanded(
            child: body,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                if (showCancelBtn) ...[
                  Expanded(
                    flex: cancelFlex,
                    child: OutlinedButton(
                      onPressed: onCancel,
                      // style: OutlinedButton.styleFrom(
                      //   backgroundColor: Theme.of(context).appColors.grey,
                      // ),
                      child: Text(
                        cancelTxt ?? tr.cancel,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).appColors.blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                ],
                if (showDoneBtn)
                  Expanded(
                    flex: doneFlex,
                    child: Opacity(
                      opacity: enableDoneBtn ? 1 : 0.5,
                      child: IgnorePointer(
                        ignoring: !enableDoneBtn,
                        child: ElevatedButton(
                          onPressed: onDone,
                          child: Text(doneTxt ?? tr.confirm),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
