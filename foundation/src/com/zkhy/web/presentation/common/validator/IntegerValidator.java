package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;

/**
 * 半角数字チェック
 *
 */
public class IntegerValidator extends RegexValidator {
    // 正規表現（ゼロを許す）
    private static final String REGEX_ALLOW_ZERO = "^[0-9]+$";
    // 正規表現（ゼロを許さない）
    private static final String REGEX_NOT_ALLOW_ZERO = "^[1-9][0-9]*$";
    // ゼロを許すフラグ
    private boolean allowZero = true;
    // アイテムラベル
    private LabelCode itemLabel;

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     */
    public IntegerValidator(String itemName, LabelCode itemLabel) {
        // 親のコンストラクタ
        super(itemName);
        this.itemLabel = itemLabel;
    }

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     * @param allowZero ゼロを許すフラグ
     */
    public IntegerValidator(String itemName, LabelCode itemLabel, boolean allowZero) {
        // super(itemName, itemLabel, REGEX, MessageCode.E000022);
        this(itemName, itemLabel);
        this.allowZero = allowZero;
    }

    @Override
    protected String getRegex() {
        if (allowZero) {
            return REGEX_ALLOW_ZERO;
        } else {
            return REGEX_NOT_ALLOW_ZERO;
        }
    }

    @Override
    protected I18nMessage getErrorMessage(I18nMessageAccessor accessor, Locale locale) {
        if (this.itemLabel == null) {
            return new I18nMessage(accessor, locale, getMessageCode());
        } else {
            String i18nItemName = accessor.getMessage(itemLabel, locale);
            Object[] params = new Object[]{i18nItemName};
            return new I18nMessage(accessor, locale, getMessageCode(), params);
        }
    }

    /**
     * メッセージコードを取得する。
     *
     * @return メッセージコード
     */
    private MessageCode getMessageCode() {
        if (allowZero) {
            return MessageCode.UNKNOW;
        } else {
            return MessageCode.UNKNOW;
        }
    }
}
