package cn.controller;


import cn.entity.*;
import cn.entity.Plan;
import cn.service.PlanService;
import cn.service.PlanService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nnn
 * @since 2021-01-13
 */
@Controller
@RequestMapping("/plan")
public class PlanController {
    @Autowired
    PlanService planService;

    @RequestMapping("list")
    public String list(String name, Integer pageIndex, Model model){
        QueryWrapper<Plan> wrapper=new QueryWrapper<Plan>();
        if(!StringUtils.isEmpty(name)){
            wrapper.like("name",name);
            model.addAttribute("name", name);
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
        IPage<Plan> page = new Page<Plan>(pageIndex, pageSize);
        page = planService.page(page, wrapper);
        List<Plan> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        return "manage/jsp/planList";

    }

    @RequestMapping("blist")
    public String blist(String name, Integer pageIndex, Model model){
        QueryWrapper<Plan> wrapper=new QueryWrapper<Plan>();
        if(!StringUtils.isEmpty(name)){
            wrapper.like("name",name);
            model.addAttribute("name", name);
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
        IPage<Plan> page = new Page<Plan>(pageIndex, pageSize);
        page = planService.page(page, wrapper);
        List<Plan> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        return "jsp/planList";

    }

    @RequestMapping("add")
    public String add(Plan plan){
        plan.setIsdel(0);
        if(planService.save(plan)){
            return "redirect:/plan/list";
        }else{
            return "manage/jsp/plansAdd";
        }
    }

    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Plan plan =planService.getById(id);
        plan.setIsdel(1);
        if(planService.updateById(plan)){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("update")
    public String update(Integer id,Model model){
        Plan plan=planService.getById(id);
        model.addAttribute("plan", plan);
        return "manage/jsp/planUpdate";
    }

    @RequestMapping("updateexe")
    public String updatetexe(Plan plan){
        if(planService.updateById(plan)){
            return "redirect:/plan/list";
        }
        return "manage/jsp/planUpdate";
    }
}

