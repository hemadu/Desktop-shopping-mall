package cn.controller;


import cn.entity.Address;
import cn.entity.Users;
import cn.service.AddressService;
import cn.util.Constants;
import cn.util.PageBean;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private AddressService addressService;

    //给下拉框赋值
    @RequestMapping("jsonlist")
    @ResponseBody
    public List<Address> jsonlist(HttpSession session){
        Users users = (Users) session.getAttribute(Constants.USER_SESSION);
        QueryWrapper<Address> wrapper = new QueryWrapper<Address>();
        wrapper.eq("uid",users.getId());
        List<Address> list = addressService.list(wrapper);
        return list;
    }

    @RequestMapping("list")
    public String list(Integer pageIndex, Model model){
        QueryWrapper<Address> wrapper=new QueryWrapper<Address>();

        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Address> page = new Page<Address>(pageIndex, pageSize);
        page = addressService.page(page, wrapper);
        List<Address> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());

        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        return "manage/jsp/addressList";

    }

    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Address address=addressService.getById(id);
        if(addressService.removeById(address)){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("update")
    public String update(Integer id,Model model){
        Address address=addressService.getById(id);
        model.addAttribute("address", address);
        return "manage/jsp/addressUpdate";
    }

    @RequestMapping("updateexe")
    public String updatetexe(Address address){
        if(addressService.updateById(address)){
            return "redirect:/address/list";
        }
        return "manage/jsp/addressUpdate";
    }

    @RequestMapping("add")
    public String add(Address address, HttpSession session){
        Users users = (Users) session.getAttribute(Constants.USER_SESSION);
        address.setUid(users.getId());
        if(addressService.save(address)){
            return "redirect:/address/list";
        }else{
            return "manage/jsp/addressAdd";
        }
    }

}

