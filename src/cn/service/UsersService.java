package cn.service;

import cn.entity.Users;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author nnn
 * @since 2021-02-01
 */
public interface UsersService extends IService<Users> {
    public Users login(String username,String password);
    public Users check(String username);
}
