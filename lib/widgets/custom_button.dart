import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll17:
        return getPadding(
          all: 17,
        );
      case ButtonPadding.PaddingT17:
        return getPadding(
          top: 17,
          right: 17,
          bottom: 17,
        );
        case ButtonPadding.PaddingT18:
        return getPadding(
          top: 80,
          right: 20,
          bottom: 10,
        );
      case ButtonPadding.PaddingAll16:
        return getPadding(
          all: 14,
        );
      case ButtonPadding.PaddingT14:
        return getPadding(
          top: 14,
          right: 14,
          bottom: 14,
        );
      default:
        return getPadding(
          all: 6,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillGray100:
        return ColorConstant.gray100;
      case ButtonVariant.FillDeeporangeA200:
        return ColorConstant.deepOrangeA200;
      case ButtonVariant.OutlineBluegray50:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillBluegray5001:
        return ColorConstant.blueGray5001;
      case ButtonVariant.OutlineIndigo50:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillGreen50:
        return ColorConstant.green50;
      case ButtonVariant.FillRed50:
        return ColorConstant.red50;
      case ButtonVariant.FillRed5001:
        return ColorConstant.red5001;
      case ButtonVariant.OutlineGray900:
        return null;
      default:
        return ColorConstant.gray900;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray900:
        return BorderSide(
          color: ColorConstant.gray900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray50:
        return BorderSide(
          color: ColorConstant.blueGray50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigo50:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillGray100:
      case ButtonVariant.FillGray900:
      case ButtonVariant.FillDeeporangeA200:
      case ButtonVariant.FillBluegray5001:
      case ButtonVariant.FillGreen50:
      case ButtonVariant.FillRed50:
      case ButtonVariant.FillRed5001:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case ButtonShape.RoundedBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case ButtonShape.CustomBorderTL24:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              24.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              24.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              24.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.RoundedBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      case ButtonShape.RoundedBorder4:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PlusJakartaSansSemiBold16Gray50:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.31,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold16Gray900_1:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.31,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold14Gray50:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.29,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold12Gray50:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.33,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold12Gray900_1:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.33,
          ),
        );
      case ButtonFontStyle.InterRegular12Bluegray400:
        return TextStyle(
          color: ColorConstant.blueGray400,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.25,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansMedium14Gray50:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.29,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold16Bluegray300_1:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.31,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold12WhiteA700_1:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.33,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold12Gray600_1:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.33,
          ),
        );
      case ButtonFontStyle.InterRegular12GreenA700_1:
        return TextStyle(
          color: ColorConstant.greenA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.25,
          ),
        );
      case ButtonFontStyle.InterRegular12Deeporange400_1:
        return TextStyle(
          color: ColorConstant.deepOrange400,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.25,
          ),
        );
      case ButtonFontStyle.InterRegular12RedA200_1:
        return TextStyle(
          color: ColorConstant.redA200,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.25,
          ),
        );
      case ButtonFontStyle.PlusJakartaSansSemiBold14Gray900_1:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.29,
          ),
        );
      default:
        return TextStyle(
          color: ColorConstant.blueGray400,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.33,
          ),
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
  RoundedBorder24,
  RoundedBorder20,
  CustomBorderTL24,
  RoundedBorder12,
  RoundedBorder4,
}

enum ButtonPadding {
  PaddingAll5,
  PaddingAll17,
  PaddingT17,
  PaddingAll16,
  PaddingT14, PaddingT18,
}

enum ButtonVariant {
  FillGray100,
  FillGray900,
  OutlineGray900,
  FillDeeporangeA200,
  OutlineBluegray50,
  FillBluegray5001,
  OutlineIndigo50,
  FillGreen50,
  FillRed50,
  FillRed5001,
}

enum ButtonFontStyle {
  PlusJakartaSansMedium12Bluegray400,
  PlusJakartaSansSemiBold16Gray50,
  PlusJakartaSansSemiBold16Gray900_1,
  PlusJakartaSansSemiBold14Gray50,
  PlusJakartaSansSemiBold12Gray50,
  PlusJakartaSansSemiBold12Gray900_1,
  InterRegular12Bluegray400,
  PlusJakartaSansMedium14Gray50,
  PlusJakartaSansSemiBold16Bluegray300_1,
  PlusJakartaSansSemiBold12WhiteA700_1,
  PlusJakartaSansSemiBold12Gray600_1,
  InterRegular12GreenA700_1,
  InterRegular12Deeporange400_1,
  InterRegular12RedA200_1,
  PlusJakartaSansSemiBold14Gray900_1,
}
