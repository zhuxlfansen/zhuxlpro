package ustc.yzwx.presentation.student.action;

import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ustc.yzwx.business.activity.ActivityService;
import ustc.yzwx.business.student.StudentService;
import ustc.yzwx.presentation.activity.form.Activity;

@Controller
public class StudentXlsAction {

	@Autowired
	private StudentService studentService;
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping("/createExcel")
	private String createExcel(HttpServletRequest request,
			HttpServletResponse response,Integer activityId){
		// 第一步，创建一个webbook，对应一个Excel文件
				HSSFWorkbook wb = new HSSFWorkbook();
				// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmsss");
				String fileName="";
				HSSFSheet sheet=null;
				if(activityId!=null){
					fileName="Activity"+activityId+"_"+sdf.format(new Date());
					Activity activity = activityService.findById(activityId);
					sheet = wb.createSheet(activity.getName());
				}else{
					fileName="Student"+sdf.format(new Date());
					sheet = wb.createSheet("考生记录");
				}
				// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
				HSSFRow row = sheet.createRow((int) 0);
				// 第四步，创建单元格，并设置值表头 设置表头居中
				HSSFCellStyle style = wb.createCellStyle();
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

				HSSFCell cell = row.createCell((short) 0);
				cell.setCellValue("姓名");
				cell.setCellStyle(style);
				cell = row.createCell((short) 1);
				cell.setCellValue("电话");
				cell.setCellStyle(style);
				cell = row.createCell((short) 2);
				cell.setCellValue("email");
				cell.setCellStyle(style);
				cell = row.createCell((short) 3);
				cell.setCellValue("学校/专业");
				cell.setCellStyle(style);
				cell = row.createCell((short) 4);
				cell.setCellValue("加权平均成绩");
				cell.setCellStyle(style);
				cell = row.createCell((short) 5);
				cell.setCellValue("班级排名");
				cell.setCellStyle(style);
				cell = row.createCell((short) 6);
				cell.setCellValue("拟报考专业");
				cell.setCellStyle(style);
				cell = row.createCell((short) 7);
				cell.setCellValue("签到活动");
				cell.setCellStyle(style);
				if(activityId==null){
					cell = row.createCell((short) 8);
					cell.setCellValue("报名活动");
					cell.setCellStyle(style);
				}
				

				// 第五步，写入实体数据 实际应用中这些数据从数据库得到，
				List<Map<String,Object>> mapList = null;
				
				if(activityId==null){
					mapList= studentService.selectAllStudent();
				}else{
					mapList=studentService.selectStudentListByParam(activityId);
				}
				for(int i = 0; i < mapList.size(); i++){
					row = sheet.createRow((int) i + 1);
					row.createCell((short) 0).setCellValue((String)mapList.get(i).get("studentName"));
					row.createCell((short) 1).setCellValue((String)mapList.get(i).get("contact"));
					row.createCell((short) 2).setCellValue((String)mapList.get(i).get("email"));
					row.createCell((short) 3).setCellValue(mapList.get(i).get("schoolName")+"/"+mapList.get(i).get("studentMajor"));
					String gpa="";
					if(mapList.get(i).get("gpa")!=null){
						gpa=(float)mapList.get(i).get("gpa")+"";
					}else{
						gpa="--";
					}
					row.createCell((short) 4).setCellValue(gpa);
					String rank ="";
					if(mapList.get(i).get("rank")!=null){
						DecimalFormat df  = new DecimalFormat("###.00"); 
						//String rankStr=mapList.get(i).get("rank").toString();
						rank=df.format(Double.parseDouble(mapList.get(i).get("rank").toString())*100)+"%";
						//rank=df.format(Double.parseDouble(rankStr))+"%";
					}else{
						rank="--";
					}
					row.createCell((short) 5).setCellValue(rank);
					row.createCell((short) 6).setCellValue((String)mapList.get(i).get("majorList"));
					row.createCell((short) 7).setCellValue((String)mapList.get(i).get("activityQDList"));
					if(activityId==null){
						row.createCell((short) 8).setCellValue((String)mapList.get(i).get("activityBMList"));
					}
				}
				// 第六步，将文件存到指定位置
				try
				{
					String path = request.getSession().getServletContext().getRealPath("/")+"static/upload/"+fileName+".xls";
					FileOutputStream fout = new FileOutputStream(path);
					wb.write(fout);
					fout.close();
					request.setAttribute("fileName", fileName);
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
		
		return "downXls";
	}
	
}
