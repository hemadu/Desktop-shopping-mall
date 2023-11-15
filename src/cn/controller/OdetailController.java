package cn.controller;


import cn.entity.Goods;
import cn.entity.Odetail;
import cn.entity.Users;
import cn.service.GoodsService;
import cn.service.OdetailService;
import cn.service.OrdersService;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
@RequestMapping("/odetail")
public class OdetailController {
    @Autowired
    OdetailService odetailService;
    @Autowired
    OrdersService ordersService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    TypeService typeService;

    @RequestMapping("list")
    public String list(Integer oid, Integer pageIndex, Model model){
        QueryWrapper<Odetail> wrapper=new QueryWrapper<Odetail>();
        if(oid!=null&&oid!=0){
            wrapper.eq("oid", oid);
        }
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Odetail> page = new Page<Odetail>(pageIndex, pageSize);
        page = odetailService.page(page, wrapper);
        List<Odetail> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());
        // 关联对象
        for(Odetail e:list){
            Goods goods=goodsService.getById(e.getGid());
            goods.setType(typeService.getById(goods.getTid()));
            e.setGoods(goods);
        }
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        model.addAttribute("oid", oid);
        return "manage/jsp/odetailList";
    }

    @RequestMapping("blist")
    public String blist(Integer oid, Integer pageIndex, Model model){
        QueryWrapper<Odetail> wrapper=new QueryWrapper<Odetail>();

        if(oid!=null&&oid!=0){
            wrapper.eq("oid", oid);
        }
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Odetail> page = new Page<Odetail>(pageIndex, pageSize);
        page = odetailService.page(page, wrapper);
        List<Odetail> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());
        // 关联对象
        for(Odetail e:list){
            Goods goods=goodsService.getById(e.getGid());
            goods.setType(typeService.getById(goods.getTid()));
            e.setGoods(goods);
        }
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        model.addAttribute("oid", oid);
        return "jsp/odetailList";
    }

}

