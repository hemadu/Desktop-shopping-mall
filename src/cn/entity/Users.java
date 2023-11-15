package cn.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author nnn
 * @since 2021-02-02
 */
@TableName("users")
public class Users extends Model<Users> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

        /**
     * 0会员1管理员
     */
         private Integer role;

        /**
     * 电话
     */
         private String phone;

        /**
     * 用户名
     */
         private String username;

        /**
     * 密码
     */
         private String password;

        /**
     * 昵称
     */
         private String name;

        /**
     * 地址ID
     */
         private Integer aid;

        /**
     * 头像
     */
         private String pic;

        /**
     * 性别
     */
         private String sex;

        /**
     * 生日
     */
         private String birth;

        /**
     * 邮箱
     */
         private String email;

    private Integer isdel;

    @TableField(exist = false)
    private Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Users{" +
        "id=" + id +
        ", role=" + role +
        ", phone=" + phone +
        ", username=" + username +
        ", password=" + password +
        ", name=" + name +
        ", aid=" + aid +
        ", pic=" + pic +
        ", sex=" + sex +
        ", birth=" + birth +
        ", email=" + email +
        ", isdel=" + isdel +
        "}";
    }
}
