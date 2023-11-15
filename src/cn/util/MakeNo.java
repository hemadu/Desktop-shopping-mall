package cn.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MakeNo {

    public static String make() {
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String no=sdf.format(date);
        return no;
    }
    public static String getYear() {
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
        String no=sdf.format(date);
        return no;
    }

}
