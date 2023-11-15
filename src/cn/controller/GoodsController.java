package cn.controller;


import cn.entity.*;
import cn.entity.Goods;
import cn.service.GoodsService;
import cn.service.PlanService;
import cn.service.TypeService;
import cn.service.GoodsService;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
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
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    GoodsService goodsService;
    @Autowired
    TypeService typeService;
    @Autowired
    PlanService planService;


    @RequestMapping("list")
    public String list(Integer change,String name, Integer tid, Integer pageIndex, Model model, HttpSession session) {
        QueryWrapper<Goods> wrapper=new QueryWrapper<Goods>();
        if(!StringUtils.isEmpty(name)){
            wrapper.like("name",name);
            model.addAttribute("name", name);
        }
        if(tid!=null){
            wrapper.eq("tid", tid);
            model.addAttribute("tid", tid);
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
        IPage<Goods> page = new Page<Goods>(pageIndex, pageSize);
        page = goodsService.page(page, wrapper);
        List<Goods> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());

        // 关联对象
        for(Goods e:list){
            e.setType(typeService.getById(e.getTid()));
        }

        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);

        Object o=session.getAttribute("change");
        if(o!=null){
            session.setAttribute("change",change);
        }

        if(change!=null&&change==1){
            return "manage/jsp/goodsAddList";
        }else{
            return "manage/jsp/goodsList";
        }

    }

    @RequestMapping("blist")
    public String blist(String name, Integer tid, Integer pageIndex, Model model){
        QueryWrapper<Goods> wrapper=new QueryWrapper<Goods>();
        if(!StringUtils.isEmpty(name)){
            wrapper.like("name",name);
            model.addAttribute("name", name);
        }
        if(tid!=null){
            wrapper.eq("tid", tid);
            model.addAttribute("tid", tid);
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
        IPage<Goods> page = new Page<Goods>(pageIndex, pageSize);
        page = goodsService.page(page, wrapper);
        List<Goods> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());

        // 关联对象
        for(Goods e:list){
            e.setType(typeService.getById(e.getTid()));
        }

        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);

        QueryWrapper<Plan> pwrapper=new QueryWrapper<>();
        pwrapper.eq("isdel",0);
        List<Plan> plist=planService.list(pwrapper);
        if(plist!=null && plist.size()>3){
            plist=plist.subList(0,3);
        }
        model.addAttribute("plist", plist);
        return "jsp/goodsList";

    }

    @RequestMapping("update")
    public String update(Integer id,Model model){
        Goods goods=goodsService.getById(id);
        model.addAttribute("goods", goods);
        return "manage/jsp/goodsUpdate";
    }
    @RequestMapping("updateexe")
    public String updateexe(Goods goods){
        if(goodsService.updateById(goods)){
            return "redirect:/goods/list";
        }
        return "manage/jsp/goodsUpdate";
    }
    @RequestMapping("view")
    public String view(Integer id,Model model) {
        Goods goods = goodsService.getById(id);
        goods.setType(typeService.getById(goods.getTid()));
        model.addAttribute("goods",goods);
        return "jsp/gdetail";
    }


    @RequestMapping("getById")
    @ResponseBody
    public Goods getById(Integer id) {
        Goods goods = goodsService.getById(id);
//        ------->>>>>>>>---------
        goods.setType(typeService.getById(goods.getTid()));
        return goods;
    }

    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Goods goods =goodsService.getById(id);
        goods.setIsdel(1);
        if(goodsService.updateById(goods)){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("add")
    public String add(Goods goods, HttpServletRequest request){
        goods.setIsdel(0);
        if(goodsService.save(goods)){
            return "redirect:/goods/list";
        }else{
            return "manage/jsp/goodsAdd";
        }
    }
}

