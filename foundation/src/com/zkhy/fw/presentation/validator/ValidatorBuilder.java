package com.zkhy.fw.presentation.validator;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.presentation.action.BaseAction;
import com.zkhy.fw.presentation.form.BaseForm;

/**
 * 共通チェックビルド
 * @author CTC
 *
 */
public class ValidatorBuilder {
    /**
     * JS行区切
     */
    public static final String JS_LINE = "\r\n";

    /**
     * JavaScriptのValidator変数名
     */
    public static final String BUILDER_VAR = "__validator";

    /**
     * JavaScriptのisItemNeedCheck関数名
     */
    public static final String FUNC_IS_ITEM_NEED_CHECK = "isItemNeedCheck";

    /**
     * グループ名
     */
    private String builderName = null;

    /**
     *
     */
    private Class<? extends BaseForm> clazz = null;

    /**
     * チェック一覧
     */
    private List<AbstractValidator> rules = new ArrayList<AbstractValidator>();

    /**
     * コンストラクタ
     *
     * @param functionName グループ名
     * @param clazz クラス
     */
    public ValidatorBuilder(String functionName, Class<? extends BaseForm> clazz) {
        this.builderName = functionName;
        this.clazz = clazz;
    }

    /**
     * コンストラクタ
     * @param clazz クラス
     */
    public ValidatorBuilder(Class<? extends BaseForm> clazz) {
        this("is" + clazz.getSimpleName() + "Valid", clazz);
    }

    /**
     * builderNameを返却する。
     *
     * @return builderName
     */
    public String getbBuilderName() {
        return builderName;
    }

    /**
     * rulesを返却する。
     *
     * @return rules
     */
    public List<AbstractValidator> getRules() {
        return rules;
    }


    /**
     *
     * @param rule ValidatorRule
     */
    public final void add(AbstractValidator rule) {
        this.rules.add(rule);
    }

    /**
     * クラスを取得する。
     * @return クラス
     */
    public Class<? extends BaseForm> getClazz() {
        return clazz;
    }

    /**
     * チェックを行う
     *
     * @param action アクション
     * @param e チェック対象
     * @param context 言語コンテキスト
     * @return チェック結果
     */
    public List<I18nMessage> doValidate(BaseAction action, BaseForm e, I18nContext context) {
        // エラーメッセージ初期化
        List<I18nMessage> lst = new ArrayList<I18nMessage>();
        //
        I18nMessage message = null;
        String conditionFuncKey = null;
        boolean isCheck = false;
        // チェックされた項目リスト
        List<String> checkedList = new ArrayList<String>();
        for (AbstractValidator rule : this.rules) {
            // チェック対象フラグ
            isCheck = true;
            // 条件がある場合
            conditionFuncKey = rule.getConditionFuncKey();
            if (!StringUtils.isBlank(conditionFuncKey)) {
                isCheck = action.isItemNeedCheck(e, conditionFuncKey);
            }
            // チェック対象外の場合
            if (!isCheck) {
                // 次ぎ
                continue;
            }
            // 当該アイテムが既にチェックされた場合
            if (checkedList.contains(rule.getItemKey())) {
                // 次ぎ
                continue;
            }
            // チェックする。
            message = rule.validate(e, context);
            if (message != null) {
                // 既にチェックされたアイテムを設定する。
                checkedList.add(rule.getItemKey());
                // エラーメッセージを追加する。
                lst.add(message);
            }
        }
        return lst;
    }

    /**
     * Js関数を生成する。
     *
     * @param context 言語コンテキスト
     * @return Js関数
     */
    public StringBuilder toJsFunction(I18nContext context) {
        StringBuilder sb = new StringBuilder();
        // 関数ヘッダー
        sb.append("var " + this.builderName + " = function() {").append(JS_LINE);
        // 関数ボディ
        sb.append("  var " + BUILDER_VAR + "= new ValidatorBuilder();").append(JS_LINE);
        // ルールの毎に繰り返し
        for (AbstractValidator rule : this.rules) {
            // 条件チェックキー
            String conditionKey = rule.getConditionFuncKey();
            // 条件チェックがある場合
            if (!StringUtils.isBlank(conditionKey)) {
                sb.append("if (" + FUNC_IS_ITEM_NEED_CHECK + "(\"");
                sb.append(StringEscapeUtils.escapeEcmaScript(conditionKey));
                sb.append("\")) {").append(JS_LINE);
            }
            // ルールをJSに生成する
            sb.append(rule.toJsBlock(context)).append(JS_LINE);
            // 条件チェックがある場合
            if (!StringUtils.isBlank(conditionKey)) {
                sb.append(" }").append(JS_LINE);
            }
        }
        // 関数フッター
        sb.append("  return " + BUILDER_VAR + ".doValid();").append(JS_LINE);
        sb.append("};").append(JS_LINE);
        return sb;
    }

}
