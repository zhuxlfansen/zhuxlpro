package com.zkhy.fw.presentation.validator;

import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.presentation.form.BaseForm;

/**
 * 基底チェックルール
 *
 * @author guozhiqiang
 */
public abstract class AbstractValidator {
    /**
     * JS行区切
     */
    protected static final String JS_LINE = ValidatorBuilder.JS_LINE;

    /**
     * JavaScriptのValidator変数名
     */
    protected static final String BUILDER_VAR = ValidatorBuilder.BUILDER_VAR;

    /**
     * 条件チェック関数名
     */
    private String conditionFuncKey = null;

    /**
     * アイテムキー
     */
    private String itemKey = null;

    /**
     * 条件キーを取得する。
     * @return 条件キー
     */
    public String getConditionFuncKey() {
        return this.conditionFuncKey;
    }

    /**
     * itemKeyを返却する。
     *
     * @return itemKey
     */
    public final String getItemKey() {
        return itemKey;
    }

    /**
     * 条件キーを設定する。
     * @param conditionFuncKey 条件キー
     */
    public void setConditionFuncKey(String conditionFuncKey) {
        this.conditionFuncKey = conditionFuncKey;
    }

    /**
     * コンストラクタ
     * @param itemKey アイテムキー
     */
    public AbstractValidator(String itemKey) {
        this.itemKey = itemKey;
    }

    /**
     * チェックを行う
     *
     * @param form チェック対象
     * @param context 言語コンテキスト
     * @return エラーメッセージ
     */
    public abstract I18nMessage validate(BaseForm form, I18nContext context);

    /**
     * JSルールコードを生成する。
     *
     * @param context 言語コンテキスト
     * @return JSコード
     */
    protected abstract StringBuilder toJsRule(I18nContext context);

    /**
     * JSブロックを生成する。
     *
     * @param context 言語コンテキスト
     * @return JSコード
     */
    public final StringBuilder toJsBlock(I18nContext context) {
        return toJsRule(context);
    }
}
