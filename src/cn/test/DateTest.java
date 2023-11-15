package cn.test;


import cn.entity.Users;
import cn.mapper.UsersMapper;
import cn.service.UsersService;
import cn.service.impl.UsersServiceImpl;
import cn.util.MakeNo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import javafx.application.Application;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class DateTest{
    @Autowired
    private UsersService usersService;
    public static void main(String[] args) {
      UsersService usersService=new UsersServiceImpl();
      System.out.println(usersService.check("admin"));
    }

}
