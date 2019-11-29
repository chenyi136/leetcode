package com.mc.portal.pojo;
import com.mc.portal.crux.Global;
/**
 * 数据层-在线用户
 * @author 1138789752@qq.com
 * @version 2017-10-30 11:53:14
 * */
public class OnlineInfo {
	public String id;
	public String name;
	public String face;
	public String power;
	public static class Config {
		/**保存最后访问页面*/
		public Boolean KEEY_LOCAL_ADDRESS = true;
		/**显示底部意见反馈*/
		public Boolean SHOW_BOTTOM_FEEDBACK = true;
		/**显示分页请求参数*/
		public Boolean SHOW_JUMP_PAGING = true;
		/**是分页显示报纸吗*/
		public Boolean SHOW_PAGE_SHEET = true;
		/**分页每页默认条数*/
		public Long LEAF_DEF_SIZE = Global.LEAF_DEF_SIZE;
		/**分页每页最大条数*/
		public Long LEAF_MAX_SIZE = Global.LEAF_MAX_SIZE;
		/**分页快捷增减条数*/
		public Long LEAF_MOVE_SIZE = 3L;
		/**页面广告推荐模式：DE(系统默认)、OK(用户推荐)、NO(用户隐藏)*/
		public String ADVERT_GROOM_MODE = "DE";
		/**编程代码显示样式*/
		public String CODE_SHOW_STYLE = "github";
		public void setKEEY_LOCAL_ADDRESS(Boolean kEEY_LOCAL_ADDRESS) {
			KEEY_LOCAL_ADDRESS = kEEY_LOCAL_ADDRESS;
		}
		public void setSHOW_BOTTOM_FEEDBACK(Boolean sHOW_BOTTOM_FEEDBACK) {
			SHOW_BOTTOM_FEEDBACK = sHOW_BOTTOM_FEEDBACK;
		}
		public void setSHOW_JUMP_PAGING(Boolean sHOW_JUMP_PAGING) {
			SHOW_JUMP_PAGING = sHOW_JUMP_PAGING;
		}
		public void setSHOW_PAGE_SHEET(Boolean sHOW_PAGE_SHEET) {
			SHOW_PAGE_SHEET = sHOW_PAGE_SHEET;
		}
		public void setLEAF_DEF_SIZE(Long lEAF_DEF_SIZE) {
			LEAF_DEF_SIZE = lEAF_DEF_SIZE;
		}
		public void setLEAF_MAX_SIZE(Long lEAF_MAX_SIZE) {
			LEAF_MAX_SIZE = lEAF_MAX_SIZE;
		}
		public void setLEAF_MOVE_SIZE(Long lEAF_MOVE_SIZE) {
			LEAF_MOVE_SIZE = lEAF_MOVE_SIZE;
		}
		public void setADVERT_GROOM_MODE(String aDVERT_GROOM_MODE) {
			ADVERT_GROOM_MODE = aDVERT_GROOM_MODE;
		}
		public void setCODE_SHOW_STYLE(String cODE_SHOW_STYLE) {
			CODE_SHOW_STYLE = cODE_SHOW_STYLE;
		}
	}
}