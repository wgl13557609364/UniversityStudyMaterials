package com.example.work8;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.icu.util.Calendar;
import android.os.Bundle;
import android.widget.Button;
import android.widget.CalendarView;
import android.widget.TextView;
import android.widget.TimePicker;

public class DActivity extends AppCompatActivity {
    private Button bt_date;
    private Button bt_time;
    private TextView tv_time, tv_date;
    private int year, monthOfYear, dayOfMonth, hour, minute;

    DatePickerDialog.OnDateSetListener onDateSetListener = (datePicker, year, monthOfYear, dayOfMonth) -> {
            DActivity.this.year=year;
            DActivity.this.monthOfYear=monthOfYear;
            DActivity.this.dayOfMonth=dayOfMonth;
            tv_date.setText(year+"年"+(monthOfYear+1)+"月"+dayOfMonth+"日");

    };

    TimePickerDialog.OnTimeSetListener onTimeSetListener=(timePicker, hour, minute) -> {
        DActivity.this.hour=hour;
        DActivity.this.minute=minute;
        tv_time.setText(hour+"时"+minute+"分");

    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dactivity);

        bt_date=findViewById(R.id.bt_date);
        bt_time=findViewById(R.id.bt_time);
        tv_date=findViewById(R.id.tv_date);
        tv_time=findViewById(R.id.tv_time);

        Calendar ca = Calendar.getInstance();
        year=ca.get(Calendar.YEAR);
        monthOfYear=ca.get(Calendar.MONTH);
        dayOfMonth=ca.get(Calendar.DAY_OF_MONTH);
        hour=ca.get(Calendar.HOUR_OF_DAY);
        minute=ca.get(Calendar.MINUTE);

        bt_date.setOnClickListener(view -> {
            new DatePickerDialog(DActivity.this,onDateSetListener,year,monthOfYear,dayOfMonth).show();
        });

        bt_time.setOnClickListener(view -> {
            new TimePickerDialog(DActivity.this,onTimeSetListener,hour,minute,true).show();
            tv_time.setText(hour+"时"+minute+"分");
        });

    }
}