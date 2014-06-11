package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;

/**
 * 数値チェック（少数を許す）
 *
 * @author huiyu
 */
public class DecimalValidator extends RegexValidator {

    private LabelCode itemLabel;
    private int integerPart;
    private int decimalPart;

    /**
     * コンストラクタ
     *
     * @param itemName フィールド名
     * @param itemLabel フィールドラベル
     * @param integerPart 整数部の桁数
     * @param decimalPart 小数部の桁数
     */
    public DecimalValidator(String itemName, LabelCode itemLabel, int integerPart, int decimalPart) {
        super(itemName);
        this.itemLabel = itemLabel;
        this.integerPart = integerPart;
        this.decimalPart = decimalPart;
    }

    @Override
    protected String getRegex() {
        String integerReg = "^(0|([1-9]\\d{0," + (integerPart - 1) + "}))";
        String decimalReg = "(\\.\\d{1," + decimalPart + "})?$";
        if (decimalPart == 0) {
            decimalReg = "$";
        }
        return integerReg + decimalReg;
    }

    @Override
    protected I18nMessage getErrorMessage(I18nMessageAccessor accessor, Locale locale) {
        String itemLabelString = accessor.getMessage(itemLabel, locale);
        Object[] params = new Object[]{itemLabelString, String.valueOf(integerPart), String.valueOf(decimalPart)};
        return new I18nMessage(accessor, locale, MessageCode.UNKNOW, params);
    }

}
