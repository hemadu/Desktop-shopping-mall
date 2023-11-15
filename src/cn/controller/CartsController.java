package cn.controller;


import cn.entity.*;
import cn.service.*;
import cn.service.CartsService;
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
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author nnn
 * @since 2021-01-13
 */
@Controller
@RequestMapping("/carts")
public class CartsController {
    @Autowired
    CartsService cartsService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    UsersService usersService;
    @Autowired
    TypeService typeService;
    @Autowired
    PdetailService pdetailService;

//    @RequestMapping("list")
//    public String list(Integer pageIndex, Model model, HttpSession session) {
//        Users users = (Users) session.getAttribute(Constants.USER_SESSION);
//        QueryWrapper<Carts> wrapper = new QueryWrapper<Carts>();
//
//        if (users != null) {
//            wrapper.eq("uid", users.getId());
//        }
//        //设置页面容量
//        int pageSize = Constants.pageSize;
//        if (pageIndex == null) {
//            pageIndex = 1;
//        }
//        PageBean pageBean = new PageBean();
//        pageBean.setPageNo(pageIndex);
//        pageBean.setPageSize(pageSize);
//        IPage<Carts> page = new Page<Carts>(pageIndex, pageSize);
//        page = cartsService.page(page, wrapper);
//        List<Carts> list = page.getRecords();
//        pageBean.setTotalCount((int) page.getTotal());
//
//        // 关联对象
//        for (Carts e : list) {
//            e.setUsers(usersService.getById(e.getUid()));
//            Goods goods = goodsService.getById(e.getGid());
//            goods.setType(typeService.getById(goods.getTid()));
//            e.setGoods(goods);
//         }
//        Double price=0.0;
//        for (Carts e : cartsService.list(wrapper)) {
//            price+=e.getQuantity()*goodsService.getById(e.getGid()).getPrice();
//        }
//        model.addAttribute("pageBean", pageBean);
//        model.addAttribute("list", list);
//        model.addAttribute("price", price);
//        model.addAttribute("pageIndex", pageIndex);
//        return "jsp/cartsList";
//
//    }

    @RequestMapping("list")
    public String list(Model model, HttpSession session) {
        Users users = (Users) session.getAttribute(Constants.USER_SESSION);
        QueryWrapper<Carts> wrapper = new QueryWrapper<Carts>();

        if (users != null) {
            wrapper.eq("uid", users.getId());
        }

        List<Carts> list = cartsService.list(wrapper);
        Carts cpu=new Carts();
        Carts zb=new Carts();
        Carts nc =new Carts();
        Carts yp =new Carts();
        Carts gtyp =new Carts();
        Carts xk =new Carts();
        Carts xsq =new Carts();
        Carts jx =new Carts();
        Carts dy =new Carts();
        Carts srq =new Carts();
        Carts sb =new Carts();
        Carts jp =new Carts();
        Carts jstz =new Carts();
        Carts yx =new Carts();
        Carts gq =new Carts();
        Carts sk =new Carts();
        Carts wk =new Carts();
        // 关联对象
        for (Carts e : list) {
            Goods goods=goodsService.getById(e.getGid());
            e.setGoods(goods);
            switch(goods.getTid()){
                case 1:
                    cpu=e;
                    break;
                case 2:
                    zb=e;
                    break;
                case 3:
                    nc=e;
                    break;
                case 4:
                    yp=e;
                    break;
                case 5:
                    gtyp=e;
                    break;
                case 6:
                    xk=e;
                    break;
                case 7:
                    xsq=e;
                    break;
                case 8:
                    jx=e;
                    break;
                case 9:
                    dy=e;
                    break;
                case 10:
                    srq=e;
                    break;
                case 11:
                    sb=e;
                    break;
                case 12:
                    jp=e;
                    break;
                case 13:
                    jstz=e;
                    break;
                case 14:
                    yx=e;
                    break;
                case 15:
                    gq=e;
                    break;
                case 16:
                    sk=e;
                    break;
                case 17:
                    wk=e;
                    break;

            }
         }

        Double price=0.0;
        for (Carts e : cartsService.list(wrapper)) {
            price+=e.getQuantity()*goodsService.getById(e.getGid()).getPrice();
        }
        model.addAttribute("list", list);
        model.addAttribute("price", price);

        model.addAttribute("cpu", cpu);
        model.addAttribute("zb", zb);
        model.addAttribute("nc", nc);
        model.addAttribute("yp", yp);
        model.addAttribute("gtyp", gtyp);
        model.addAttribute("xk", xk);
        model.addAttribute("xsq", xsq);
        model.addAttribute("jx", jx);
        model.addAttribute("dy", dy);
        model.addAttribute("srq", srq);
        model.addAttribute("sb", sb);
        model.addAttribute("jp", jp);
        model.addAttribute("jstz", jstz);
        model.addAttribute("yx", yx);
        model.addAttribute("gq", gq);
        model.addAttribute("sk", sk);
        model.addAttribute("wk", wk);
        return "jsp/cartsList";

    }

    @RequestMapping("addquantity")
    @ResponseBody
    public HashMap<String, String> addquantity(Integer id, Integer quantity) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Carts carts = cartsService.getById(id);
        Goods goods = goodsService.getById(carts.getGid());
        if (goods.getQuantity() > quantity) {
            quantity++;
            carts.setQuantity(quantity);
            cartsService.updateById(carts);
            resultMap.put("Result", "true");
        } else {
            resultMap.put("Result", "false");
        }
        return resultMap;
    }

    @RequestMapping("delquantity")
    @ResponseBody
    public HashMap<String, String> delquantity(Integer id, Integer quantity) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Carts carts = cartsService.getById(id);
        if (quantity != 1) {
            quantity--;
            carts.setQuantity(quantity);
            cartsService.updateById(carts);
            resultMap.put("Result", "true");
        } else {
            resultMap.put("Result", "false");
        }
        return resultMap;
    }

    @RequestMapping("add")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> add(Integer id,Integer pid, Integer pdid, HttpSession session) {
        Users users = (Users) session.getAttribute(Constants.USER_SESSION);
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(users!=null) {
            //先判断购物车有没有该商品
            Integer isTrue=0;
            QueryWrapper<Carts> wrapper1 = new QueryWrapper<Carts>();
            wrapper1.eq("uid",users.getId());
            List<Carts> cartsList = cartsService.list(wrapper1);
            if (id != null && id != 0) {
                Integer temp=goodsService.getById(id).getTid();//得到商品类别
                for (Carts c : cartsList) {
                    if (goodsService.getById(c.getGid()).getTid() == temp) {
                        isTrue++;
                    } }
            }
            if (pdid != null && pdid != 0) {
                Integer temp=goodsService.getById(pdetailService.getById(pdid).getGid()).getTid();
                for (Carts c : cartsList) {
                    if (goodsService.getById(c.getGid()).getTid() == temp) {
                        isTrue++;
                    } }
            }
            if (pid != null && pid != 0) {
                QueryWrapper<Pdetail> wrapper2 = new QueryWrapper<Pdetail>();
                wrapper2.eq("pid", pid);
                List<Pdetail> pdetailList = pdetailService.list(wrapper2);
                for (Pdetail e : pdetailList) {
                    Integer temp=goodsService.getById(e.getGid()).getTid();
                    for (Carts c : cartsList) {
                        if (goodsService.getById(c.getGid()).getTid() == temp) {
                            isTrue++;
                        } }
                }

            }


            if(isTrue!=0){
                resultMap.put("addResult", "false");
                return resultMap;
            }



            if (id != null && id != 0) {//添加单个商品   此处是Goods id
                Carts carts = new Carts();
                carts.setUid(users.getId());
                carts.setGid(id);
                carts.setQuantity(1);
                if (cartsService.save(carts)) {
                    resultMap.put("addResult", "true");
                } else {
                    resultMap.put("addResult", "false");
                }
            }

            if (pdid != null && pdid != 0) {//添加单个商品   此处是pdetail id
                Carts carts = new Carts();
                carts.setUid(users.getId());
                carts.setGid(pdetailService.getById(pdid).getGid());
                carts.setQuantity(pdetailService.getById(pdid).getQuantity());
//                Object o = session.getAttribute("pid");
//                if (o != null) {
//                    pid = (Integer) o;
//                }
                if (cartsService.save(carts)) {
                    resultMap.put("addResult", "true");
                } else {
                    resultMap.put("addResult", "false");
                }

            }

            if (pid != null && pid != 0) { //添加方案里所有商品
                QueryWrapper<Pdetail> wrapper = new QueryWrapper<Pdetail>();
                wrapper.eq("pid", pid);
                List<Pdetail> pdetailList = pdetailService.list(wrapper);
                for (Pdetail e : pdetailList) {
                    Carts carts = new Carts();
                    carts.setUid(users.getId());
                    carts.setGid(e.getGid());
                    carts.setQuantity(e.getQuantity());
                    cartsService.save(carts);
                }

                //session.setAttribute("pid",pid);
                    resultMap.put("addResult", "true");
            }
        }else{
            resultMap.put("addResult", "login");
        }
        return resultMap;
    }

    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id, HttpSession session) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Carts carts = cartsService.getById(id);
        Object o=session.getAttribute("pid");
        if(o!=null){
            session.setAttribute("pid",null);
        }

        if (cartsService.removeById(carts)) {
            resultMap.put("delResult", "true");
        } else {
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }
}

