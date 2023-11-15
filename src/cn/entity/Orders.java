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
@TableName("orders")
public class Orders extends Model<Orders> {

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
     * 总价
     */
    @TableField("price")
    private Double price;

    /**
     * 订单号
     */
    @TableField("no")
    private String no;

    /**
     * 总数
     */
    @TableField("quantity")
    private Integer quantity;

    /**
     * 订单类型
     */
    @TableField("type")
    private String type;

    /**
     * 订单状态
     */
    @TableField("status")
    private String status;

    @TableField("isdel")
    private Integer isdel;

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Integer getId() {
        return id;
    }

    public Orders setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getUid() {
        return uid;
    }

    public Orders setUid(Integer uid) {
        this.uid = uid;
        return this;
    }

    public Double getPrice() {
        return price;
    }

    public Orders setPrice(Double price) {
        this.price = price;
        return this;
    }

    public String getNo() {
        return no;
    }

    public Orders setNo(String no) {
        this.no = no;
        return this;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Orders setQuantity(Integer quantity) {
        this.quantity = quantity;
        return this;
    }

    public String getType() {
        return type;
    }

    public Orders setType(String type) {
        this.type = type;
        return this;
    }

    public String getStatus() {
        return status;
    }

    public Orders setStatus(String status) {
        this.status = status;
        return this;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public Orders setIsdel(Integer isdel) {
        this.isdel = isdel;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Orders{" +
        "id=" + id +
        ", uid=" + uid +
        ", price=" + price +
        ", no=" + no +
        ", quantity=" + quantity +
        ", type=" + type +
        ", status=" + status +
        ", isdel=" + isdel +
        "}";
    }
}
