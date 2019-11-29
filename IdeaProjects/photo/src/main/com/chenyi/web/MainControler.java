package main.com.chenyi.web;

import com.sun.tools.internal.ws.processor.model.Model;
import main.com.chenyi.entity.Picture;
import main.com.chenyi.entity.User;
import main.com.chenyi.service.PictureService;
import main.com.chenyi.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class MainControler {
    @Controller
    public class MainController {
        @Autowired
        private PictureService pictureService;
        @Autowired
        private UserService userService;
        @RequestMapping(value = "/")
        public String index(Model model){
            List<Picture> pictures =pictureService.getAllPicture();
            System.out.println(pictures.size());
            model.addAttribute("pictures",pictures);
            return "index";
        }
        @RequestMapping(value = "login")
        public String login(){
            return "login";
        }
        @RequestMapping(value = "checkandRedict")
        public String checkAndRedict(@Param("username") String username, @Param("pwd") String pwd){
            User user = userService.CheckUser(username,pwd);
            System.out.println(user);
            if (user!=null){
                return "upload";
            }else {
                return "index";
            }
        }
        @RequestMapping(value = "upload",method = RequestMethod.POST)
        public String upload(@RequestParam("file") MultipartFile file, @Param("content") String content, HttpServletRequest request, Model model) throws IOException{
            boolean result = false;
            //获取项目的根路径，将上传图片的路径与我们的资源路径在一起，才能显示
            if (!file.isEmpty()){
                result= pictureService.uploadFile(file);
            }else if(content==null){
                content = "";//如果输入为null数据库不允许插入
            }
            //图片类的名字保存为路径+名字方便后期前端提取
            //将图片名字用时间戳保存，反正上传图片为中文乱码等问题
            if (result) {
                List<Picture> pictures = pictureService.getAllPicture();
                model.addAttribute("pictures", pictures);
                return "index";
            }else
                return "index";
        }
}
