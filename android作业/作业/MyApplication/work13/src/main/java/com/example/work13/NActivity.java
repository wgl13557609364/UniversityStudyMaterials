package com.example.work13;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NotificationCompat;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationChannelGroup;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

import java.util.regex.Pattern;

public class NActivity extends AppCompatActivity {
    private Button bt;
    private EditText edt;
    private TextView tv;
    NotificationManager manager;
    NotificationChannelGroup channelGroup;
    NotificationChannel notificationChannel;
    Notification notification;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_nactivity);

        bt = findViewById(R.id.bt);
        edt = findViewById(R.id.edt);
        tv=findViewById(R.id.tv);

        //管理通知类
        manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        //通知渠道组用于管理通知渠道
        channelGroup = new NotificationChannelGroup("GroupId1", "GroupName1");
        //创建通知渠道组
        manager.createNotificationChannelGroup(channelGroup);
        //创建通知渠道
        notificationChannel = new NotificationChannel("ChannelId1", "ChannelName1", NotificationManager.IMPORTANCE_HIGH);
        notificationChannel.enableLights(true);//允许使用LED消息提示灯
        notificationChannel.enableVibration(true);//允许振动
        notificationChannel.setLightColor(Color.YELLOW);//设置LED提示灯为黄色
        notificationChannel.setVibrationPattern(new long[]{0, 100, 100, 100});//设置振动的频率
        notificationChannel.setGroup("GroupId1");//设置通知渠道组
        manager.createNotificationChannel(notificationChannel);

        // 通知跳转动作
        Intent intent = new Intent(this, MainActivityTest.class);
        PendingIntent pi = PendingIntent.getActivity(this, 0, intent, 0);
        //构造通知
        notification = new NotificationCompat.Builder(this, "ChannelId1")
                .setContentTitle("上课了上课了！")
                .setContentText("你老师喊你回直播间上网课啦！")
                .setWhen(System.currentTimeMillis())
                .setSmallIcon(R.mipmap.ic_launcher)
                .setLargeIcon(BitmapFactory.decodeResource(getResources(), R.mipmap.ic_launcher))
                .setContentIntent(pi)
                .setAutoCancel(true)
                .build();


        bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String trim = edt.getText().toString().trim();
                Pattern pattern = Pattern.compile("[0-9]*");
                if (!pattern.matcher(trim).matches()||trim.length()==0){
                    Toast.makeText(NActivity.this, "只能输入纯数字!", Toast.LENGTH_SHORT).show();
                    return;
                }
                int second = Integer.parseInt(trim);
                new CountDownTimer(second * 1000L, 1000) {
                    @Override
                    public void onTick(long l) {
                        tv.setText((l/1000)+"秒后发通知!");
                    }

                    @Override
                    public void onFinish() {
                        tv.setText("通知已发出!");
                        manager.notify(0, notification);//发通知
                    }
                }.start();

            }
        });
    }
}