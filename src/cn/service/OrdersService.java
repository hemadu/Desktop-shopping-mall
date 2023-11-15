package cn.service;

import cn.entity.Orders;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author nnn
 * @since 2021-01-13
 */
public interface OrdersService extends IService<Orders> {
    public boolean save(Orders orders);
}
