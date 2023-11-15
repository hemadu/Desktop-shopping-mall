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
@TableName("odetail")
public class Odetail extends Model<Odetail> {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 订单
     */
    @TableField("oid")
    private Integer oid;

    @TableField(exist = false)
    private Orders orders;
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

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
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

    public Odetail setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getOid() {
        return oid;
    }

    public Odetail setOid(Integer oid) {
        this.oid = oid;
        return this;
    }

    public Integer getGid() {
        return gid;
    }

    public Odetail setGid(Integer gid) {
        this.gid = gid;
        return this;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Odetail setQuantity(Integer quantity) {
        this.quantity = quantity;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Odetail{" +
        "id=" + id +
        ", oid=" + oid +
        ", gid=" + gid +
        ", quantity=" + quantity +
        "}";
    }
}
