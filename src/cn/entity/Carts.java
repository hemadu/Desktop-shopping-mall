package cn.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author nnn
 * @since 2021-01-13
 */
@TableName("carts")
public class Carts extends Model<Carts> {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户
     */
    @TableField("uid")
    private Integer uid;

    @TableField(exist = false)
    private Users users;

    /**
     * 商品
     */
    @TableField("gid")
    private Integer gid;

    @TableField(exist = false)
    private Goods goods;

    /**
     * 数量
     */
    @TableField("quantity")
    private Integer quantity;

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getId() {
        return id;
    }

    public Carts setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getUid() {
        return uid;
    }

    public Carts setUid(Integer uid) {
        this.uid = uid;
        return this;
    }

    public Integer getGid() {
        return gid;
    }

    public Carts setGid(Integer gid) {
        this.gid = gid;
        return this;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Carts setQuantity(Integer quantity) {
        this.quantity = quantity;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Carts{" +
        "id=" + id +
        ", uid=" + uid +
        ", gid=" + gid +
        ", quantity=" + quantity +
        "}";
    }
}
