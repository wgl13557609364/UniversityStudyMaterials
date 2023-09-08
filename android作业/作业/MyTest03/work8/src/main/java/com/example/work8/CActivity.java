package com.example.work8;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.widget.CalendarView;
import android.widget.TextView;

public class CActivity extends AppCompatActivity {

    private TextView ctv;
    private CalendarView cld;
    private int cyear;
    private int cmonth;
    private int cday;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cactivity);

        ctv=(TextView) findViewById(R.id.ctv);
        cld=(CalendarView) findViewById(R.id.cld);
        cld.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
            @Override
            public void onSelectedDayChange(@NonNull CalendarView calendarView, int i, int i1, int i2) {
                cyear=i;
                cmonth=i1+1;
                cday=i2;

                AlertDialog.Builder dialog = new AlertDialog.Builder(CActivity.this);
                dialog.setTitle("确定选中？");
                dialog.setMessage("您确定选中这一天去表白吗？");
                dialog.setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        ctv.setText("您选了"+cyear+"-"+cmonth+"-"+cday+"这一天！祝你表白成功!");
                    }
                });
                dialog.setNegativeButton("取消", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        ctv.setText("表白失败！");
                    }
                });
                dialog.create();
                dialog.show();
            }
        });
    }
}