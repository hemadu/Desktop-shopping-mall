package cn.mapper;

import cn.entity.Carts;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nnn
 * @since 2021-01-13
 */
public interface CartsMapper extends BaseMapper<Carts> {
//    @Select(" select * from carts,users,goods where hou_users.name like '%${name}%' and hou_house.price>#{minPrice}")
//    public List<Carts> getCarts(Map<String,Object> params);
}
