package cn.controller;

import cn.entity.Users;
import cn.service.UsersService;
import cn.util.Constants;
import cn.util.MD5Util;
import cn.util.ServerResponse;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author nnn
 * @since 2019-12-07
 */
@Controller
public class IndexController {
    @Autowired
    UsersService usersService;


    @RequestMapping("/login")
    public String login(String username, String password,HttpSession session) {
//        //判断验证码是否正确
//        if (!CaptchaUtil.ver(captcha, request)) {
//            CaptchaUtil.clear(request); // 清除session中的验证码
//            return new ServerResponse<String>("101","验证码错误");
//        }
        QueryWrapper<Users> wrapper = new QueryWrapper<Users>();
        wrapper.eq("username", username);
        wrapper.eq("password", password);
        wrapper.eq("isdel", 0);
        List<Users> list = usersService.list(wrapper);
        if (list != null && list.size() > 0) {
            Users users = list.get(0);
            session.setAttribute(Constants.USER_SESSION, users);

//            //查询通知
//            QueryWrapper<Users> wrapper1=new QueryWrapper<Users>();
//            //wrapper1.orderByDesc("id");
//            wrapper1.eq("isdel", 2);
//            List<Users>usersList=usersService.list(wrapper1);
//            request.getSession().setAttribute("usersList", usersList);

            return "manage/jsp/index";
        }

        return "manage/jsp/login";

    }

    @RequestMapping("/blogin")
    public String blogin(String username, String password,HttpSession session) {
        QueryWrapper<Users> wrapper = new QueryWrapper<Users>();
        wrapper.eq("username", username);
        wrapper.eq("password", password);
        wrapper.eq("isdel", 0);
        wrapper.eq("role", 0);
        List<Users> list = usersService.list(wrapper);
        if (list != null && list.size() > 0) {
            Users users = list.get(0);
            session.setAttribute(Constants.USER_SESSION, users);
            return "redirect:/goods/blist";
        }
        return "jsp/login";
    }

    @RequestMapping("/update")
    public String update() {
        return "manage/jsp/userModify";
    }

    @RequestMapping("updateexe")
    public String updateexe(Users users,HttpSession session){
        if(usersService.updateById(users)){
            session.setAttribute(Constants.USER_SESSION,users);
            return "manage/jsp/index";
        }else{
            return "manage/jsp/userModify";
        }
    }

    @RequestMapping("/bupdate")
    public String bupdate() {
        return "jsp/userModify";
    }

    @RequestMapping("bupdateexe")
    public String bupdateexe(Users users,HttpSession session){
        if(usersService.updateById(users)){
            session.setAttribute(Constants.USER_SESSION,users);
            return "redirect:/blogout";
        }else{
            return "jsp/userModify";
        }
    }

    @RequestMapping("updatepwd")
    public String updatepwd(String password,HttpSession session){
        if(!StringUtils.isNullOrEmpty(password)){
            Users users = (Users) session.getAttribute(Constants.USER_SESSION);
            users.setPassword(password);
            if(usersService.updateById(users)){
                return "redirect:/logout";
            }
        }
        return "manage/jsp/userModify";
    }
    @RequestMapping("bupdatepwd")
    public String bupdatepwd(String password,HttpSession session){
        if(!StringUtils.isNullOrEmpty(password)){
            Users users = (Users) session.getAttribute(Constants.USER_SESSION);
            users.setPassword(password);
            if(usersService.updateById(users)){
                return "redirect:/blogout";
            }
        }
        return "jsp/userModify";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "manage/jsp/login";
    }
    @RequestMapping("/blogout")
    public String blogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "jsp/login";
    }


//    //找回密码
//    @RequestMapping("/find")
//    @ResponseBody
//    public ServerResponse<String> find(String username,String phone) {
//        boolean flag=false;
//        QueryWrapper<Users> wrapper = new QueryWrapper<Users>();
//        wrapper.eq("username", username);
//        wrapper.eq("phone", phone);
//        List<Users> list = usersService.list(wrapper);
//
//        if (list != null && list.size() > 0) {
//            //如何找回？发送邮件
//            Users users=list.get(0);
//            String password=users.getPassword();
//            //主人，我是发件人，我是QQ邮箱。我要一个授权码
//            String content="您的密码是:<h1 style='color:#F00'>"+password+"</h1> <p><a href='https://www.baidu.com?id="+users.getId()+"'>请点击此链接修改新密码！</a></p>";
//            //springMail.send(users.getPhone(),"找回密码",content);
//        }else{
//            return new ServerResponse<String>("1","Email不正确");
//        }
//        return new ServerResponse<String>("1", "找回成功");
//    }


}
