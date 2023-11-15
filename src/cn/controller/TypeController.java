package cn.controller;


import cn.entity.Pdetail;
import cn.entity.Type;
import cn.entity.Type;
import cn.entity.Type;
import cn.service.TypeService;
import cn.util.Constants;
import cn.util.PageBean;
import cn.util.ServerResponse;
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
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    //给下拉框赋值
    @RequestMapping("jsonlist")
    @ResponseBody
    public List<Type> jsonlist() {
        QueryWrapper<Type> wrapper = new QueryWrapper<Type>();
        wrapper.eq("isdel", 0);
        List<Type> list = typeService.list(wrapper);
        return list;
    }

    @RequestMapping("list")
    public String list(Integer pageIndex, Model model){
        QueryWrapper<Type> wrapper=new QueryWrapper<Type>();

        wrapper.eq("isdel", 0);
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Type> page = new Page<Type>(pageIndex, pageSize);
        page = typeService.page(page, wrapper);
        List<Type> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());

        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        return "manage/jsp/typeList";

    }

    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Type type=typeService.getById(id);
        type.setIsdel(1);
        if(typeService.updateById(type)){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("update")
    public String update(Integer id,Model model){
        Type type=typeService.getById(id);
        model.addAttribute("type", type);
        return "manage/jsp/typeUpdate";
    }

    @RequestMapping("updateexe")
    public String updatetexe(Type type){
        if(typeService.updateById(type)){
            return "redirect:/type/list";
        }
        return "manage/jsp/typeUpdate";
    }

    @RequestMapping("add")
    public String add(Type type){
        type.setIsdel(0);
        if(typeService.save(type)){
            return "redirect:/type/list";
        }else{
            return "manage/jsp/typeAdd";
        }
    }

}

