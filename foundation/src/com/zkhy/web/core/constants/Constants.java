package com.zkhy.web.core.constants;

/**
 * 定数クラス
 *
 * @author guozhiqiang
 */
public final class Constants {

    private Constants() {
    }

    /**
     * タグデリミタ
     */
    public static final String TAG_SEP = "_";
    /** COMMA : , */
    public static final String COMMA = ",";
    /** SPACE : */
    public static final String SPACE = "";
    /** SLASH : / */
    public static final String SLASH = "/";
    /** WIND_VEL_SEP : / */
    public static final String WIND_VEL_SEP = "/";
    /** ESCAPT RIGHT SLASH : / */
    public static final String ESCAPE_RIGHT_SLASH = "\\";
    /** BLANK : / */
    public static final String BLANK = " ";
    /** COLON : / */
    public static final String COLON = ":";
    /** LEFT_EN_MID_BRACKET : / */
    public static final String LEFT_EN_MID_BRACKET = "[";
    /** RIGHT_MID_BRACKET : / */
    public static final String RIGHT_EN_MID_BRACKET = "]";
    /** RIGHT_EN_MID_BRACKET : / */
    public static final String LEFT_MID_BRACKET = "「";
    /** RIGHT_MID_BRACKET : / */
    public static final String RIGHT_MID_BRACKET = "」";
    /** BLANK : / */
    public static final String FULL_SPACE = "　";
    /** CIRCLE_MARK */
    public static final String CIRCLE_MARK = "◎";
    /** LEFT_BRACKET */
    public static final String LEFT_BRACKET = "(";
    /** RIGHT_BRACKET */
    public static final String RIGHT_BRACKET = ")";
    /** percent : % */
    public static final String PERCENT = "%";
    /** CROSS */
    public static final String CROSS = "-";
    /** yyyymm01で日付 */
    public static final String MONTH_NUM_USE = "01";
    /** Monthで日付 */
    public static final String MONTH = "年";
    /** Dayで日付 */
    public static final String DAY = "月";
    /** WAVE : ～  */
    public static final String WAVE = "～";
    /** number : 0 */
    public static final String NUM_ZERO = "0";
    /**boolean true**/
    public static final String BOOL_TRUE = "true";
    /**boolean false**/
    public static final String BOOL_FALSE = "false";

    /** string : null */
    public static final String STR_NULL = "null";

    /** string : Calc Failed */
    public static final String STR_CALC_FAILED = "Calc Failed";

    /** question mark : ? */
    public static final String QUESTION_MARK = "?";
    /** equal sign : = */
    public static final String EQUAL_SIGN = "=";

    /** 削除フラグ 0：削除しない */
    public static final String DEL_FLG_VALID = "0";

    /** 削除フラグ 1：削除した */
    public static final String DEL_FLG_DELETED = "1";

    /** ユーザー区分:0 E-PLSM管理者 */
    public static final String USER_ROLE_ADMIN = "0";
    /** ユーザー区分:1 顧客管理者 */
    public static final String USER_ROLE_MANAGE = "1";
    /** ユーザー区分:2 一般ユーザー */
    public static final String USER_ROLE_USER = "2";

    /** セッションからログイン時間を取得するためのキー */
    public static final String SESSION_KEY_LOGIN_DATE = "SESSION_KEY_LOGIN_DATE";

    /** 画面遷移URLキー  **/
    public static final String MODEL_KEY_REDIRECT = "redirectUrl";

    /**
     * 画面配置情報
     */
    /** デフォルトの画像パス */
    public static final String DEFAULT_IMAGE_URL = "/static/images/";

	/** 登录成功 */
    public static final String LOGIN_STATUS_SUCCESS = "1";
    
    /** 登录失败 */
    public static final String LOGIN_STATUS_FAILURE = "0";
}
