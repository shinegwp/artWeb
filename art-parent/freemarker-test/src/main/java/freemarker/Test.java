package freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class Test {
    public static void main(String[] args) {
		Configuration conf = new Configuration();
		
		//设置要生成的HTML页面
		String path = "C:/trainSW/workT/artWeb/art-parent/freemarker-test/src/test/java/test.html";
	    //用文件流的形式向文件中写东西
		File file = new File(path);
		
		//判断
		File fileParent = file.getParentFile();
		if (!fileParent.exists()) {
			fileParent.mkdirs();
		}
		
		//设置模板信息
		//1.加载模板所在的全路径
		Writer out = null;
		try {
			conf.setDirectoryForTemplateLoading(new File("C:/trainSW/workT/artWeb/art-parent/freemarker-test/html-template"));
			Template template = conf.getTemplate("mytemplate.html");
			
			//获取动态数据
			
			Map<String, Object> root = new HashMap<String, Object>();
		    root.put("name", "酱油三人组");
		    //创建输出流
		    out = new OutputStreamWriter(new FileOutputStream(file));
		    
		    //开始静态化
		    template.process(root, out);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
    }
}
