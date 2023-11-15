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
@TableName("pdetail")
public class Pdetail extends Model<Pdetail> {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 方案ID
     */
    @TableField("pid")
    private Integer pid;

    @TableField(exist = false)
    private Plan plan;

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


    public Integer getId() {
        return id;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Pdetail setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getPid() {
        return pid;
    }

    public Pdetail setPid(Integer pid) {
        this.pid = pid;
        return this;
    }

    public Integer getGid() {
        return gid;
    }

    public Pdetail setGid(Integer gid) {
        this.gid = gid;
        return this;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Pdetail setQuantity(Integer quantity) {
        this.quantity = quantity;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Pdetail{" +
        "id=" + id +
        ", pid=" + pid +
        ", gid=" + gid +
        ", quantity=" + quantity +
        "}";
    }
}
