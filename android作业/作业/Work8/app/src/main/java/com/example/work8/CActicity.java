package com.example.work8;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.widget.CalendarView;
import android.widget.TextView;

public class CActicity extends AppCompatActivity {
    private TextView ctv;
    private CalendarView cld;
    private int cyear;
    private int cmonth;
    private int cday;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cacticity);

        ctv=findViewById(R.id.ctv);
        cld=findViewById(R.id.cld);
        cld.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
            @Override
            public void onSelectedDayChange(@NonNull CalendarView arg0, int arg1, int arg2, int arg3) {
                cyear=arg1;
                cmonth=arg2+1;
                cday=arg3;
                AlertDialog.Builder dialog = new AlertDialog.Builder(CActicity.this);
                dialog.setTitle("确定选中? ");
                dialog.setMessage("你确定选中这一天去表白吗? ");
                dialog.setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        ctv.setText("你选了"+cyear+"-"+cmonth+"-"+cday+" 这一天! 祝你表白成功! ");
                    }
                });
                dialog.setNegativeButton("取消", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        ctv.setText("你不敢选，表白失败! ");
                    }
                });
                dialog.create();
                dialog.show();
            }
        });
    }
}