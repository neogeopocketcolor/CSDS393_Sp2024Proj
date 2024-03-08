package com.example.demo.utils;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

    public static String DateNow(){
        Date dNow = new Date();   //当前时间
        Date dBefore = new Date();
        Calendar calendar = Calendar.getInstance(); //得到日历
        calendar.setTime(dNow);//把当前时间赋给日历
        //  calendar.add(Calendar.MINUTE, 0);  //设置为前10分钟
        dBefore = calendar.getTime();   //得到前一天的时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //设置时间格式
        String defaultStartDate = sdf.format(dBefore); //格式化前一天
        String defaultEndDate = sdf.format(dNow); //格式化当前时间
        return defaultEndDate;
    }

    public static String addTime(int time){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar c = Calendar.getInstance();
        if(time<=1){
            c.add(Calendar.DAY_OF_MONTH, 1);
        }else{
            c.add(Calendar.DAY_OF_MONTH, time);
        }
        return sf.format(c.getTime());
    }

    public static String getMonth(){
        SimpleDateFormat sf = new SimpleDateFormat("MMM.yyyy", Locale.ENGLISH);
        Calendar c = Calendar.getInstance();
        return sf.format(c.getTime());
    }

    public static String getDay(){
        Date dNow = new Date();   //当前时间
        Date dBefore = new Date();
        Calendar calendar = Calendar.getInstance(); //得到日历
        calendar.setTime(dNow);//把当前时间赋给日历
        //  calendar.add(Calendar.MINUTE, 0);  //设置为前10分钟
        dBefore = calendar.getTime();   //得到前一天的时间
        SimpleDateFormat sdf=new SimpleDateFormat("dd"); //设置时间格式
        String defaultStartDate = sdf.format(dBefore); //格式化前一天
        String defaultEndDate = sdf.format(dNow); //格式化当前时间
        return defaultEndDate;
    }

    /**
     * 获取当前是周几
     * @param time 毫秒
     * @return string
     */
    public static String getDateForEEETime(long time) {

        Date d = new Date(time);
        SimpleDateFormat sf = new SimpleDateFormat("EEE");
        return sf.format(d);
    }

    public static String getDateForMMMTime(long time) {
        //注意传入的要是一个毫秒
        Date d = new Date(time);
        SimpleDateFormat sf = new SimpleDateFormat("MMM d | yyyy", Locale.ENGLISH);
        return sf.format(d);
    }
}
