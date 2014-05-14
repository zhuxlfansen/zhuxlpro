package cn.achero.common.core.i18n;

import java.io.Serializable;
import java.util.Locale;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * @author user
 *
 */
public class I18nMessage implements Serializable {

	/**
	 * 自动生成
	 */
	private static final long serialVersionUID = -2835315146186323626L;

	/**
     * message Type
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
         * 取得Code
         *
         * @return code
         */
        public int getCode() {
            return code;
        }

        /**
         * 取得Prefix
         *
         * @return prefix
         */
        public String getPrefix() {
            return prefix;
        }

        /**
         * 取得message的type
         *
         * @param code messageCode
         * @return message type
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
     * message type
     */
    private I18nMessageType type;

    /**
     * message item
     */
    private String item = null;

    /**
     * message code
     */
    private String code = null;

    /**
     * message text
     */
    private String text = null;

    /**
     * message 参数
     */
    @JsonIgnore
    private transient Object[] params = null;

    /**
     * 输出信息
     *
     * @param accessor I18nMessageAccessor
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, I18nCode code, Object... args) {
        // 调用别的方法
        this(accessor, null, null, code, args);
    }

    /**
     * 输出信息
     *
     * @param accessor I18nMessageAccessor
     * @param item String
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, String item, I18nCode code, Object... args) {
        // 调用别的方法
        this(accessor, null, item, code, args);
    }

    /**
     * 输出信息
     *
     * @param accessor I18nMessageAccessor
     * @param locale Locale
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, Locale locale, I18nCode code, Object... args) {
        // 调用别的方法
        this(accessor, locale, null, code, args);
    }

    /**
     * 输出信息
     *
     * @param accessor I18nMessageAccessor
     * @param locale Locale
     * @param item String
     * @param code I18nCode
     * @param args Object
     */
    public I18nMessage(I18nMessageAccessor accessor, Locale locale, String item, I18nCode code, Object... args) {
        this.type = I18nMessageType.parse(code);
        // 取得message code
        this.code = code.getCode();
        // message 参数
        this.params = args;
        // text取得
        this.text = accessor.getMessage(code, args, locale);
        // 保存item
        this.item = item;
    }

    /**
     * 取得信息type
     *
     * @return type
     */
    public I18nMessageType getType() {
        return type;
    }

    /**
     * 取得信息code
     *
     * @return code
     */
    public String getCode() {
        return code;
    }

    /**
     * 取得信息内容
     *
     * @return text
     */
    public String getText() {
        return text;
    }

    /**
     * 取得参数
     *
     * @return params
     */
    public Object[] getParams() {
        return params;
    }

    /**
     * 取得item
     *
     * @return item
     */
    public String getItem() {
        return item;
    }

    /**
     * 设定item
     *
     * @param item item
     */
    public void setItem(String item) {
        this.item = item;
    }
}
