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
@TableName("goods")
public class Goods extends Model<Goods> {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 产品类型
     */
    @TableField("tid")
    private Integer tid;

    @TableField(exist = false)
    private Type type;
    /**
     * 产品名称
     */
    @TableField("name")
    private String name;

    /**
     * 价格
     */
    @TableField("price")
    private Double price;

    /**
     * 库存
     */
    @TableField("quantity")
    private Integer quantity;

    /**
     * 图片
     */
    @TableField("pic")
    private String pic;

    /**
     * 描述
     */
    @TableField("content")
    private String content;

    @TableField("isdel")
    private Integer isdel;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public Goods setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getTid() {
        return tid;
    }

    public Goods setTid(Integer tid) {
        this.tid = tid;
        return this;
    }

    public String getName() {
        return name;
    }

    public Goods setName(String name) {
        this.name = name;
        return this;
    }

    public Double getPrice() {
        return price;
    }

    public Goods setPrice(Double price) {
        this.price = price;
        return this;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Goods setQuantity(Integer quantity) {
        this.quantity = quantity;
        return this;
    }

    public String getPic() {
        return pic;
    }

    public Goods setPic(String pic) {
        this.pic = pic;
        return this;
    }

    public String getContent() {
        return content;
    }

    public Goods setContent(String content) {
        this.content = content;
        return this;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public Goods setIsdel(Integer isdel) {
        this.isdel = isdel;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Goods{" +
        "id=" + id +
        ", tid=" + tid +
        ", name=" + name +
        ", price=" + price +
        ", quantity=" + quantity +
        ", pic=" + pic +
        ", content=" + content +
        ", isdel=" + isdel +
        "}";
    }
}
