package com.zkhy.web.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * DateUtil
 *
 * @author guozhiqiang
 *
 */
public final class DateUtil {

    private DateUtil() {
    }

    /**
     * システム日付を取得する。
     *
     * @return システム日付
     */
    public static Date nowDate() {
        Calendar c = Calendar.getInstance();
        return c.getTime();
    }

    /**
     * システム時間を取得する.
     *
     * @return システム時間
     */
    public static String getSysTime() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        return format.format(calendar.getTime());
    }

    /**
     * 指定日付の月末日を返す
     *
     * @param date Date
     * @return 月末日
     */
    public static Date getLastDayOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int dayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        calendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
        return calendar.getTime();
    }

    /**
     * 指定日付の年末日を返す
     *
     * @param date Date
     * @return 年末日
     */
    public static Date getLastDayOfYear(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.MONTH, 11);
        calendar.set(Calendar.DATE, 31);
        return calendar.getTime();
    }

    /**
     * 指定年の年末日を取得する
     *
     * @param year 指定年
     * @return 指定年の年末日
     */
    public static Date getLastDayOfYear(int year) {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(Calendar.YEAR, year);
        calendar.roll(Calendar.DAY_OF_YEAR, -1);
        return calendar.getTime();
    }

    /**
     * 日付１－日付２の日数差を返す
     *
     * @param date1 日付１
     * @param date2 日付２
     * @return 日数差
     */
    public static long diffDateWithDays(Date date1, Date date2) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date1);
        c1.set(Calendar.HOUR_OF_DAY, 0);
        c1.set(Calendar.MINUTE, 0);
        c1.set(Calendar.SECOND, 0);
        c1.set(Calendar.MILLISECOND, 0);
        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);
        c2.set(Calendar.HOUR_OF_DAY, 0);
        c2.set(Calendar.MINUTE, 0);
        c2.set(Calendar.SECOND, 0);
        c2.set(Calendar.MILLISECOND, 0);
        return (c1.getTime().getTime() - c2.getTime().getTime()) / (1000 * 3600 * 24);
    }

    /**
     * 日付１－日付２の月数差を返す
     *
     * @param date1 日付１
     * @param date2 日付２
     * @return 日数差
     */
    public static int diffDateWithMonths(Date date1, Date date2) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date1);
        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);
        return (c1.get(Calendar.YEAR) - c2.get(Calendar.YEAR)) * 12 + (c1.get(Calendar.MONTH) - c2.get(Calendar.MONTH));
    }

    /**
     *
     * @param date 日付
     * @param days 日
     * @return 日付
     */
    public static Date addDay(Date date, int days) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, days);
        return c.getTime();
    }

    /**
     *
     * @param date 日付
     * @param months 月数
     * @return 日付
     */
    public static Date addMonth(Date date, int months) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.MONTH, months);
        return c.getTime();
    }

    /**
     * 日付1 と 日付2
     *
     * @param date1 日付1
     * @param date2 日付2
     * @return 日
     */
    public static int compareDateTime(Date date1, Date date2) {
        if (date1 == null && date2 == null) {
            return 0;
        } else if (date1 == null) {
            return -1;
        } else if (date2 == null) {
            return 1;
        } else {
            return date1.compareTo(date2);
        }
    }

    /**
     * 日付1 と 日付2
     *
     * @param date1 日付1
     * @param date2 日付2
     * @return 日
     */
    public static int compareDate(Date date1, Date date2) {
        if (date1 == null && date2 == null) {
            return 0;
        } else if (date1 == null) {
            return -1;
        } else if (date2 == null) {
            return 1;
        } else {
            String c1 = DateFormat.DATE_STR8.format(date1);
            String c2 = DateFormat.DATE_STR8.format(date2);
            return c1.compareTo(c2);
        }
    }

    /**
     *
     * @author CTC
     *
     */
    public static enum DateFormat {
        /** yyyy/MM/dd */
        DATE("yyyy/MM/dd", "^([0-9]{4})/([0-9]{2})/([0-9]{2})$"),
        /** yyyyMM */
        DATE_Y4M2("yyyyMM", "^([0-9]{4})([0-9]{2})$"),
        /** yyyy-MM-dd */
        DATE_1("yyyy-MM-dd", "^([0-9]{4})-([0-9]{2})-([0-9]{2})$"),
        // EchonetLite 設備操作履歴 added by yuj 2013/11/27 start
        /** yyyy-M-d */
        DATE_2("yyyy-M-d", "^([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})$"),
        // EchonetLite 設備操作履歴 added by yuj 2013/11/27 end
        // EchonetLite エキュコント制御情報設定 added by guozhiqiang 2013/12/05 start
        /** yyyy:MM:dd */
        DATE_3("yyyy:MM:dd", "^([0-9]{4}):([0-9]{2}):([0-9]{2})$"),
        /** yyyy年MM月dd日 */
        DATE_4("yyyy年MM月dd日", "^([0-9]{4})年([0-9]{2})月([0-9]{2})日$"),
        // EchonetLite エキュコント制御情報設定 added by guozhiqiang 2013/12/05 end
        /** yyyy/MM/dd HH:mm:ss */
        DATE_TIME("yyyy/MM/dd HH:mm:ss", "^([0-9]{4})/([0-9]{2})/([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2})$"),
        // EchonetLite 設備操作履歴 added by yuj 2013/11/14 start
        /** yyyyMMdd HH:mm */
        DATE_TIME_STR14("yyyyMMdd HH:mm", "^([0-9]{4})([0-9]{2})([0-9]{2}) ([0-9]{2}):([0-9]{2})$"),
        // EchonetLite 設備操作履歴 added by yuj 2013/11/14 end
        /** yyyy-MM-dd HH:mm:ss.sss */
        DATE_TIME_MILLISECOND("yyyy-MM-dd HH:mm:ss.SSS",
            "^([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2}).({[0-9]{3}})$"),
        /** yyyyMMdd */
        DATE_STR8("yyyyMMdd", "^([0-9]{4})([0-9]{2})([0-9]{2})$"),
        /** yyyyMMddHH */
        DATE_STR10("yyyyMMddHH", "^([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})$"),
        /** yyyyMMddHHmmss */
        DATE_STR14("yyyyMMddHHmmss", "^([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})$"),
        /** yyyyMMdd HH:mm:ss */
        DATE_STR15("yyyyMMdd HH:mm:ss", "^([0-9]{4})([0-9]{2})([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2})$"),
        /** yyyyMMdd HH:mm:ss.SSS */
        DATE_STR16("yyyyMMdd HH:mm:ss.SSS", "^([0-9]{4})([0-9]{2})([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3})$"),
        /** yyyyMMddHHmmssSSS */
        DATE_STR17("yyyyMMddHHmmssSSS", "^([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{3})$"),
        /** HH:mm:ss */
        TIME("HH:mm:ss", "^([0-9]{2}):([0-9]{2}):([0-9]{2})$"),
        /** HH点mm分 */
        TIME_1("HH点mm分", "^([0-9]{2})点([0-9]{2})分$");

        private String format;
        private String regexPattern;

        private DateFormat(String format, String regexPattern) {
            this.format = format;
            this.regexPattern = regexPattern;
        }

        /**
         * formatを返却する。
         *
         * @return format
         */
        public String getFormat() {
            return format;
        }

        /**
         * regexPatternを返却する。
         *
         * @return regexPattern
         */
        public String getRegexPattern() {
            return regexPattern;
        }

        /**
         * StringからDateに変換する
         *
         * @param strDate 日付の文字列
         * @return Date
         */
        public Date parse(String strDate) {
            SimpleDateFormat fmt = new SimpleDateFormat(format);
            try {
                fmt.setLenient(false);
                return fmt.parse(strDate);
            } catch (ParseException e) {
                return null;
            }
        }

        /**
         * DateからStringに変換する
         *
         * @param date Date
         * @return String
         */
        public String format(Date date) {
            SimpleDateFormat fmt = new SimpleDateFormat(format);
            return fmt.format(date);
        }

    }

    /**
     * 開始時間と終了時間を取得する
     *
     * @param date 処理対象日付
     * @param n count
     * @param flag 開始時間と終了時間flag
     * @return 開始時間と終了時間
     *
     */
    public static Date getTestTimeStartOrEnd(Date date, int n, boolean flag) {
        int day = 1;
        String hour1 = "00";
        String hour2 = "23";
        String minute1 = "00";
        String minute2 = "59";
        String second1 = "00";
        String second2 = "59";
        String sss1 = "000";
        String sss2 = "999";
        day = day + n;
        String dayStr = String.valueOf(day);
        StringBuffer strb = new StringBuffer();
        strb.append(DateFormat.DATE_STR8.format(date));
        if (dayStr.length() == 1) {
            strb.replace(6, 8, "0" + dayStr);
        } else {
            strb.replace(6, 8, dayStr);
        }
        if (flag) {
            strb.append(hour1);
            strb.append(minute1);
            strb.append(second1);
            strb.append(sss1);
        } else {
            strb.append(hour2);
            strb.append(minute2);
            strb.append(second2);
            strb.append(sss2);
        }
        return DateFormat.DATE_STR17.parse(strb.toString());
    }
}