package cn.mapper;

import cn.entity.Users;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nnn
 * @since 2021-02-02
 */
public interface UsersMapper extends BaseMapper<Users> {
Users check(String username);
}
