package cn.service.impl;

import cn.entity.Users;
import cn.mapper.UsersMapper;
import cn.service.UsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nnn
 * @since 2021-02-01
 */
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements UsersService {
@Override
    public Users login(String username, String password) {
        Users users=this.baseMapper.check(username);
        if(users!=null){
            if(users.getPassword().equals(password)){
                return users;
            }
        }
        return null;
    }

    @Override
    public Users check(String username) {
        return this.baseMapper.check(username);
    }
}
