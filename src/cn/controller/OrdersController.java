package cn.controller;


import cn.entity.*;
import cn.entity.Orders;
import cn.service.*;
import cn.service.OrdersService;
import cn.util.Constants;
import cn.util.MakeNo;
import cn.util.PageBean;
import com.alibaba.druid.util.StringUtils;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nnn
 * @since 2020-07-14
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    OrdersService ordersService;
    @Autowired
    UsersService usersService;
    @Autowired
    CartsService cartsService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    OdetailService odetailService;
    @Autowired
    PlanService planService;

    @RequestMapping("list")
    public String list(String no, Integer pageIndex, Model model) {
        QueryWrapper<Orders> wrapper=new QueryWrapper<Orders>();
        if(!StringUtils.isEmpty(no)){
            wrapper.like("no",no);
        }
        wrapper.eq("isdel", 0);
        wrapper.orderByDesc("id");
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Orders> page = new Page<Orders>(pageIndex, pageSize);
        page = ordersService.page(page, wrapper);
        List<Orders> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());

        // 关联对象
        for(Orders e:list){
            e.setUsers(usersService.getById(e.getUid()));
        }
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        model.addAttribute("no", no);
        return "manage/jsp/ordersList";
    }

    @RequestMapping("blist")
    public String blist(Integer pageIndex, Model model,HttpSession session) {
        QueryWrapper<Orders> wrapper=new QueryWrapper<Orders>();
        Users users=(Users)session.getAttribute(Constants.USER_SESSION);
        wrapper.eq("isdel", 0);
        if(users==null){
            return "jsp/login";
        }
        wrapper.eq("uid", users.getId());
        wrapper.orderByDesc("id");
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        PageBean pageBean=new PageBean();
        pageBean.setPageNo(pageIndex);
        pageBean.setPageSize(pageSize);
        IPage<Orders> page = new Page<Orders>(pageIndex, pageSize);
        page = ordersService.page(page, wrapper);
        List<Orders> list=page.getRecords();
        pageBean.setTotalCount((int)page.getTotal());

        // 关联对象
        for(Orders e:list){
            e.setUsers(usersService.getById(e.getUid()));
        }
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("list", list);
        return "jsp/ordersList";
    }

    @RequestMapping("add")
    public String add(HttpSession session) {
        QueryWrapper<Orders> wapper = new QueryWrapper<Orders>();
        QueryWrapper<Carts> cwapper = new QueryWrapper<Carts>();
        Users users=(Users)session.getAttribute(Constants.USER_SESSION);
        cwapper.eq("uid", users.getId());
        List<Carts> cartsList=cartsService.list(cwapper);
        Integer num=0;
        Double price=0.0;
        Boolean isTrue=false;
        Boolean isTrue1=false;
        Boolean isTrue2=false;
        Boolean isTrue3=false;
        for(Carts e:cartsList){
            num+=e.getQuantity();
            price+=e.getQuantity()*goodsService.getById(e.getGid()).getPrice();
            Integer temp=goodsService.getById(e.getGid()).getTid();
            if(temp==1){
                isTrue1=true;
            }else if(temp==2){
                isTrue2=true;
            }else if(temp==3){
                isTrue3=true;
            }
            if(isTrue1&&isTrue2&&isTrue3){
                isTrue=true;
            }
        }//自助装机 经plan的订单没做选择

            if(isTrue) {

                Orders orders = new Orders();
                orders.setUid(users.getId());
                orders.setPrice(price);
                orders.setNo(MakeNo.make());
                orders.setQuantity(num);
                Object o=session.getAttribute("pid");
                if(o!=null){
                    orders.setType(planService.getById((Integer)o).getName());
                }else {
                    orders.setType("自助装机");
                }
                orders.setStatus("未发货");
                orders.setIsdel(0);

                if (ordersService.save(orders)) {
                    wapper.eq("no", orders.getNo());
                    Orders orders1 = ordersService.getOne(wapper);
                    for (Carts e : cartsList) {
                        Odetail odetail = new Odetail();
                        odetail.setOid(orders1.getId());
                        odetail.setGid(e.getGid());
                        odetail.setQuantity(e.getQuantity());
                        //减库存
                        Goods goods=goodsService.getById(e.getGid());
                        Integer num1=goods.getQuantity();
                        if(num1>e.getQuantity()){
                            num1=num1-e.getQuantity();
                            goods.setQuantity(num1);
                            goodsService.updateById(goods);
                            odetailService.save(odetail);
                            cartsService.remove(cwapper);
                        }else{
                            return "redirect:/carts/list";
                        }

                    }
                    return "redirect:/orders/blist";
                }
            }
        return "redirect:/carts/list";
    }

    @RequestMapping("update")
    public String update(Integer id,Model model,String status,Integer isdel){
        Orders orders=ordersService.getById(id);
        if(status!=null &&!"".equals(status)){
            orders.setStatus(status);
        }
        if(isdel!=null){
            orders.setIsdel(isdel);
        }
//        if(orders.getStatus().equals("未发货")){//此处要求输入快递单号
//            orders.setStatus("已发货");
//        }
//        if(orders.getStatus().equals("申请中，未同意退货")){
//            orders.setStatus("退货成功");
//        }
        if(ordersService.updateById(orders)){
            return "redirect:/orders/list";
        }
        return "manage/jsp/ordersUpdate";
    }

    @RequestMapping("bupdate")
    public String bupdate(Integer id,Model model,String status,Integer isdel){
        Orders orders=ordersService.getById(id);
        if(status!=null &&!"".equals(status)){
            orders.setStatus(status);
        }
        if(isdel!=null){
            orders.setIsdel(isdel);
        }
        ordersService.updateById(orders);
        return "redirect:/orders/blist";
    }

    @RequestMapping("getSum")
    @ResponseBody//将java对象转为json格式的数据
    public List<Map<String, Object>> getSum() {
        String year=MakeNo.getYear();
        List<Map<String,Object>>mapList=new ArrayList<Map<String, Object>>();
        Map<String,Object>map=null;
        String temp;
        for(int i=1;i<=12;i++){
            if(i<10){
                temp="0"+i;
            }else{
                temp=Integer.toString(i);
            }

            //i月份的数据
            QueryWrapper<Orders> wrapper=new QueryWrapper<Orders>();
            wrapper.like("no",year+temp);
            wrapper.eq("isdel", 0);
            List<Orders> list=ordersService.list(wrapper);
            Integer num=0;
            for(Orders o:list){//2
                QueryWrapper<Odetail> wrapper1=new QueryWrapper<Odetail>();
                wrapper1.eq("oid",o.getId());
                num+=odetailService.list(wrapper1).size();
            }
            map=new HashMap<String, Object>();
            map.put("num",num);
            map.put("noName",temp+"月");
            mapList.add(map);
        }

        return mapList;
    }

    }


