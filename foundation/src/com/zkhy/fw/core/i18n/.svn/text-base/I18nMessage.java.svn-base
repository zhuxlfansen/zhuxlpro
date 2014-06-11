package com.zkhy.fw.core.i18n;

import java.io.Serializable;
import java.util.Locale;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * メッセージ
 *
 * @author guozhiqiang
 *
 */
public class I18nMessage implements Serializable {
    /**
     * メッセージタイプ
     */
    public static enum I18nMessageType {
        /** */
        INFO(1, "I"),
        /** */
        WARN(2, "W"),
        /** */
        ERROR(3, "E"),
        /** */
        FATAL(4, "F"),
        /** */
        UNKNOW(0, "I");

        private int code;
        private String prefix;

        private I18nMessageType(int code, String prefix) {
            this.code = code;
            this.prefix = prefix;
        }

        /**
         * codeを返却する。
         *
         * @return code
         */
        public int getCode() {
            return code;
        }

        /**
         * prefixを返却する。
         *
         * @return prefix
         */
        public String getPrefix() {
            return prefix;
        }

        /**
         * メッセージタイプを解釈する。
         *
         * @param code メッセージコード
         * @return メッセージタイプ
         */
        public static I18nMessageType parse(I18nCode code) {
            for (I18nMessageType type : I18nMessageType.values()) {
                if (code.getCode().startsWith(type.getPrefix())) {
                    return type;
                }
            }
            return UNKNOW;
        }

    }

    /**
     * 自動生成
     */
    private static final long serialVersionUID = -2439727490562669202L;

    /**
     * メッセージタイプ
     */
    private I18nMessageType type;

    /**
     * メッセージアイテム
     */
    private String item = null;

    /**
     * メッセージコード
     */
    private String code = null;

    /**
     * メッセージテキスト
     */
    private String text = null;

    /**
     * メッセージパラメータ
     */
    @JsonIgnore
    private transient Object[] params = null;

    /**
     * コンストラクタ
     *
     * @param accessor I18nMessageAccessor
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, I18nCode code, Object... args) {
        // 別のコンストラクタを呼び出す
        this(accessor, null, null, code, args);
    }

    /**
     * コンストラクタ
     *
     * @param accessor I18nMessageAccessor
     * @param item String
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, String item, I18nCode code, Object... args) {
        // 別のコンストラクタを呼び出す
        this(accessor, null, item, code, args);
    }

    /**
     * コンストラクタ
     *
     * @param accessor I18nMessageAccessor
     * @param locale Locale
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, Locale locale, I18nCode code, Object... args) {
        // 別のコンストラクタを呼び出す
        this(accessor, locale, null, code, args);
    }

    /**
     * コンストラクタ
     *
     * @param accessor I18nMessageAccessor
     * @param locale Locale
     * @param item String
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, Locale locale, String item, I18nCode code, Object... args) {
        this.type = I18nMessageType.parse(code);
        // メッセージコードを設定する。
        this.code = code.getCode();
        // メッセージパラメータ
        this.params = args;
        // テキストを取得する。
        this.text = accessor.getMessage(code, args, locale);
        // ローカルを保存
        this.item = item;
    }

    /**
     * typeを返却する。
     *
     * @return type
     */
    public I18nMessageType getType() {
        return type;
    }

    /**
     * codeを返却する。
     *
     * @return code
     */
    public String getCode() {
        return code;
    }

    /**
     * textを返却する。
     *
     * @return text
     */
    public String getText() {
        return text;
    }

    /**
     * paramsを返却する。
     *
     * @return params
     */
    public Object[] getParams() {
        return params;
    }

    /**
     * itemを返却する。
     *
     * @return item
     */
    public String getItem() {
        return item;
    }

    /**
     * itemをセットする。
     *
     * @param item item
     */
    public void setItem(String item) {
        this.item = item;
    }

}