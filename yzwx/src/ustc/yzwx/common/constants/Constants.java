package ustc.yzwx.common.constants;

public final class Constants {

	public static interface ActivityStatusSet {
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
		
		/**
		 * 带参数二维码前缀qrscene_
		 */
		public static final String QRSCENE = "qrscene_";
		
		/**
		 * 默认eventKey
		 */
		public static final String DEFAULT_SUBSCRIBE = "qrscene_9";
	}
	
//	public static final String BASE_URL="yzwx.aliapp.com";
	/** appId  wx794f444fa5c9e2ba */
	public static final String APPID = "wx49e5dfe9fa7e3f9c";
	
	/** appSecret 9fc1ef40e69189872228e9612f349c60 */
	public static final String APPSECRET = "11ce992f292c8e427598fdda88dc63a9";
	
	/** 基本url : 54.186.246.81/yzwx  */
	public static final String BASE_URL="114.215.186.132/yzwx";
	//public static final String BASE_URL="54.186.246.81/yzwx";
	/** 活动详情的网页授权Url */
	public static final String ACTIVITY_OAUTH_URL="https://open.weixin.qq.com/connect/oauth2/authorize?appid="
					+APPID
					+"&redirect_uri=http%3A%2F%2F114.215.186.132%2Fyzwx%2Fmob%2FgetOAuthUserInfo%3Fid%3D"
					+"ACTIVITY_ID"
					+"&response_type=code&scope=snsapi_userinfo&state=7#wechat_redirect";
}
