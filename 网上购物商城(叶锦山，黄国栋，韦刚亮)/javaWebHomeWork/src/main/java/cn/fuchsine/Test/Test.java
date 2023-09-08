package cn.fuchsine.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author fuchsine
 * @date 2022/10/13 4:31
 * @since 1.0.0
 */
public class Test {
    @org.junit.Test
    public void t1(){
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(formatter.format(date));
        String str = formatter.format(date).replace("-","").replace(" ", "").replace(":", "");
        int number = (int)(Math.random()*100)+1;
        str="OP-"+str + number;
        System.out.println(str);

    }
}
