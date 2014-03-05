package ustc.yzwx.common.constants;

public final class Constants {
	
	public static interface ActivityStatusSet{
		/**
		 * 活动，考生报名状态
		 */
		public static final Integer STATUS_APPLY = 1;
		/**
		 * 活动，考生签到状态
		 */
		public static final Integer STATUS_SIGN = 2;
		/**
		 * 活动，考生完成状态
		 */
		public static final Integer STATUS_COMPLETE = 3;
		
		/**
		 * 活动，考生所有状态
		 */
		public static final Integer STATUS_TOTAL = 0;
	}

}
