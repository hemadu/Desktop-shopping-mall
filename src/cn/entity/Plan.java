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
@TableName("plan")
public class Plan extends Model<Plan> {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 方案名称
     */
    @TableField("name")
    private String name;

    /**
     * 方案类型
     */
    @TableField("type")
    private String type;

    /**
     * 方案总价
     */
    @TableField("price")
    private Double price;

    @TableField("isdel")
    private Integer isdel;


    public Integer getId() {
        return id;
    }

    public Plan setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Plan setName(String name) {
        this.name = name;
        return this;
    }

    public String getType() {
        return type;
    }

    public Plan setType(String type) {
        this.type = type;
        return this;
    }

    public Double getPrice() {
        return price;
    }

    public Plan setPrice(Double price) {
        this.price = price;
        return this;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public Plan setIsdel(Integer isdel) {
        this.isdel = isdel;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Plan{" +
        "id=" + id +
        ", name=" + name +
        ", type=" + type +
        ", price=" + price +
        ", isdel=" + isdel +
        "}";
    }
}
