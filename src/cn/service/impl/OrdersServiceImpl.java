package cn.service.impl;

import cn.entity.Orders;
import cn.mapper.OrdersMapper;
import cn.service.OrdersService;
import cn.util.MakeNo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nnn
 * @since 2021-01-13
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements OrdersService {
    @Override
    public boolean save(Orders orders) {
        MakeNo makeNo=new MakeNo();
        String no=makeNo.make();
        orders.setNo(makeNo.make().toString());
        Integer a=this.baseMapper.insert(orders);
        if(a>0){
            return true;
        }else{
            return false;
        }
    }
}
