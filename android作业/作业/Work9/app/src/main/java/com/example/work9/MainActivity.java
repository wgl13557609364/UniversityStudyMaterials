package com.example.work9;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlarmManager;
import android.app.DatePickerDialog;
import android.app.PendingIntent;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.icu.util.Calendar;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.DatePicker;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Button bt_date, bt_time;
    TextView tv_date, tv_time, tv_status;
    Switch sw_set;
    int year, month, day, hour, minute;
    Calendar ca = Calendar.getInstance();
    DatePickerDialog.OnDateSetListener onDateSetListener=new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
            MainActivity.this.year = year;
            MainActivity.this.month = month;
            MainActivity.this.day = dayOfMonth;
            tv_date.setText(year + "年" + (month + 1) + "月" + dayOfMonth + "日");

        }
    };


    TimePickerDialog.OnTimeSetListener onTimeSetListener=new TimePickerDialog.OnTimeSetListener() {
        @Override
        public void onTimeSet(TimePicker view, int hourOfDay,int minute){
            MainActivity.this.hour=hourOfDay ;
            MainActivity.this.minute=minute;
            tv_time.setText(hourOfDay+"时"+minute+"分");
        }
    };
    protected void setAlarm(){
        ca=Calendar.getInstance();
        ca.set(year,month,day, hour ,minute, 0);
        Intent intent=new Intent(  MainActivity.this,ALMActivity.class);
        PendingIntent pi=PendingIntent.getActivity(MainActivity.this, 0, intent, PendingIntent.FLAG_IMMUTABLE);
//        PendingIntent pi=PendingIntent.getActivity( MainActivity.this,  0,intent,0 );
        AlarmManager am=(AlarmManager)getSystemService(ALARM_SERVICE);
        am.set(AlarmManager.RTC_WAKEUP,ca.getTimeInMillis(),pi);
        Toast.makeText(  MainActivity.this, "闹钟已设置!",Toast.LENGTH_SHORT).show();tv_status.setText("闹钟时间: "+year+"年"+(month+1)+"月"+day+"日"+hour+"时" +minute+"分");

    }



    protected void cancelAlarm(){
        Intent intent=new Intent( MainActivity.this,ALMActivity.class);
        PendingIntent pi=PendingIntent.getActivity(MainActivity.this, 0, intent, PendingIntent.FLAG_IMMUTABLE);
        AlarmManager am=(AlarmManager)getSystemService(ALARM_SERVICE);
        am.cancel(pi);
        Toast.makeText(  MainActivity.this, "闹钟已取消! ",Toast.LENGTH_SHORT). show();
        tv_status.setText( "not set");
    }





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bt_date=findViewById(R.id.bt_date);
        bt_time=findViewById(R.id.bt_time);
        tv_date=findViewById(R.id.tv_date);
        tv_time=findViewById(R.id.tv_time);
        sw_set=findViewById(R.id.sw_set);
        tv_status=findViewById(R.id.tv_status);
        year=ca.get(Calendar.YEAR);
        month=ca.get(Calendar.MONTH);
        day=ca.get(Calendar.DAY_OF_MONTH);
        hour=ca.get(Calendar.HOUR_OF_DAY);
        minute=ca.get(Calendar.MINUTE);

        bt_date.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new DatePickerDialog(MainActivity.this,onDateSetListener,year,month,day).show();
            }
        });
        bt_time.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new TimePickerDialog(MainActivity.this,onTimeSetListener,hour,minute,true).show();
            }
        });
        sw_set.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked){
                    setAlarm();
                }else {
                    cancelAlarm();
                }
            }
        });

    }
    @Override
    protected void onRestart(){
        tv_date.setText("not set");
        tv_time.setText("not set");
        tv_status.setText("not set");
        sw_set.setChecked(false);
        super.onRestart();
    }

}
