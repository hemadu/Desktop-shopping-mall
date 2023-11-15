package cn.controller;
import cn.entity.Goods;
import cn.entity.Users;
import cn.service.AddressService;
import cn.service.UsersService;
import cn.util.Constants;
import cn.util.PageBean;
import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nnn
 * @since 2020-07-14
 */
@Controller
@RequestMapping("/users")
public class UsersController {
    @Autowired
    private UsersService usersService;
    @Autowired
    private AddressService addressService;

    @RequestMapping("list")
    public String list(String name,Integer role, Integer pageIndex, Model model,HttpServletRequest request) {
        QueryWrapper<Users> wrapper=new QueryWrapper<Users>();
        if(!StringUtils.isEmpty(name)){
            wrapper.like("name",name);
        }
        if(role!=null){
            wrapper.eq("role", role);
        }
        wrapper.eq("isdel", 0);

        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Users> page_Users = new Page<Users>(pageIndex, pageSize);
        page_Users = usersService.page(page_Users, wrapper);
        List<Users> list=page_Users.getRecords();
        pageBean.setTotalCount((int)page_Users.getTotal());

        // 关联对象
        for(Users u:list){
            u.setAddress(addressService.getById(u.getAid()));
        }

        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        model.addAttribute("name", name);
        model.addAttribute("role", role);
        return "manage/jsp/usersList";
    }

    @RequestMapping("add")
    public String add(Users users) {
        QueryWrapper<Users> wapper = new QueryWrapper<Users>();
        wapper.eq("username", users.getUsername());
        Users u = usersService.getOne(wapper);
            users.setIsdel(0);
            users.setRole(0);
            users.setPassword(users.getPassword());//MD5Util.getMD5(users.getPassword())
        if(usersService.save(users)){
            return "manage/jsp/login";
        }else{
            return "manage/jsp/register";
        }
    }

    @RequestMapping("badd")
    public String badd(Users users) {
        QueryWrapper<Users> wapper = new QueryWrapper<Users>();
        wapper.eq("username", users.getUsername());
        Users u = usersService.getOne(wapper);
        if (u == null) {
            users.setIsdel(0);
            users.setRole(0);
            users.setPassword(users.getPassword());
            if(usersService.save(users)){
                return "jsp/login";
            }else{
                return "jsp/register";
            }
        }else{
            return "jsp/register";
        }


    }

    @RequestMapping("check")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> check(String username){
        QueryWrapper<Users> wapper = new QueryWrapper<Users>();
        wapper.eq("username", username);
        Users u = usersService.getOne(wapper);
        HashMap<String, String> resultMap = new HashMap<String, String>();

        if(u==null){
            resultMap.put("Result", "true");
        }else{
            resultMap.put("Result", "false");
        }
        return resultMap;
    }

    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Users users =usersService.getById(id);
        users.setIsdel(1);
        if(usersService.updateById(users)){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("update")
    public String update(Integer id,Model model){
        Users users=usersService.getById(id);
        model.addAttribute("users", users);
        return "manage/jsp/usersUpdate";
    }

    @RequestMapping("updateexe")
    public String updateexe(Users users){
        if(usersService.updateById(users)){
            return "redirect:/users/list";
        }
        return "manage/jsp/usersUpdate";
    }

}

