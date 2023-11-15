package cn.controller;


import cn.entity.Goods;
import cn.entity.Pdetail;
import cn.entity.Plan;
import cn.service.GoodsService;
import cn.service.PdetailService;
import cn.service.PlanService;
import cn.service.TypeService;
import cn.util.Constants;
import cn.util.PageBean;
import cn.util.ServerResponse;
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
@RequestMapping("/pdetail")
public class PdetailController {
    @Autowired
    PdetailService pdetailService;
    @Autowired
    PlanService planService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    TypeService typeService;

    @RequestMapping("list")
    public String list(Integer pid, Integer pageIndex, Model model,HttpSession session){
        QueryWrapper<Pdetail> wrapper=new QueryWrapper<Pdetail>();
        if(pid==null) {
            Object o = session.getAttribute("pid");
            if (o != null) {
                pid = (Integer) o;
            }
        }
        //if(pid!=null&&pid!=0){
            wrapper.eq("pid", pid);
        //}
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Pdetail> page = new Page<Pdetail>(pageIndex, pageSize);
        page = pdetailService.page(page, wrapper);
        List<Pdetail> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());
        Double total=0.0;
        // 关联对象
        for(Pdetail e:list){
            Goods goods=goodsService.getById(e.getGid());
            goods.setType(typeService.getById(goods.getTid()));
            e.setGoods(goods);
            total+=e.getQuantity()*e.getGoods().getPrice();
        }
        Plan plan=planService.getById(pid).setPrice(total);
        planService.updateById(plan);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        session.setAttribute("pid", pid);
        return "manage/jsp/pdetailList";
    }

    @RequestMapping("blist")
    public String blist(Integer pid, Integer pageIndex, Model model,HttpSession session){
        QueryWrapper<Pdetail> wrapper=new QueryWrapper<Pdetail>();
        Object o=session.getAttribute("pid");
        if(o!=null){
            pid=(Integer)o;
        }
        if(pid!=null&&pid!=0){
            wrapper.eq("pid", pid);
        }
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Pdetail> page = new Page<Pdetail>(pageIndex, pageSize);
        page = pdetailService.page(page, wrapper);
        List<Pdetail> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());
        // 关联对象
        for(Pdetail e:list){
            Goods goods=goodsService.getById(e.getGid());
            goods.setType(typeService.getById(goods.getTid()));
            e.setGoods(goods);
        }
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        session.setAttribute("pid", pid);
        return "jsp/pdetailList";
    }

    @RequestMapping("add")
    public String add(Integer id,HttpSession session){
            Object o = session.getAttribute("pid");
            Integer pid=1;
            if (o != null) {
                pid = (Integer) o;
            }
        Pdetail pdetail=new Pdetail();
        pdetail.setGid(id);
        pdetail.setPid(pid);
        pdetail.setQuantity(1);
        if(pdetailService.save(pdetail)){

            return "redirect:/pdetail/list";
        }else{
            return "manage/jsp/pdetailAdd";
        }
    }

    @RequestMapping("update")
    public String update(Integer id,Model model){
        Pdetail pdetail=pdetailService.getById(id);
        model.addAttribute("pdetail", pdetail);
        return "manage/jsp/pdetailUpdate";
    }
    @RequestMapping("updateexe")
    public String updateexe(Pdetail pdetail,Model model){
        if(pdetailService.updateById(pdetail)){
            return "redirect:/pdetail/list";
        }
        return "manage/jsp/pdetailUpdate";
    }


    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(pdetailService.removeById(id)){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }
}

