package ustc.yzwx.presentation.partakeRecord.form;

import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.student.form.Student;

public class PartakeRecord {

	/**
	 * 学生对象
	 */
	private Student student;
	/**
	 * 活动对象
	 */
	private Activity activity;
	/**
	 * 满意度
	 */
	private Integer satisfaction;
	/**
	 * 建议意见
	 */
	private String suggestion;
	/**
	 * 状态：1报名2签到3完成
	 */
	private int status;
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public Integer getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(Integer satisfaction) {
		this.satisfaction = satisfaction;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
