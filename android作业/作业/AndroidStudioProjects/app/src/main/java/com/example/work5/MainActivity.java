package com.example.work5;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.RadioButton;

import com.example.work5.activity.FrameLayoutActivity;
import com.example.work5.activity.LinearLayoutActivity;
import com.example.work5.activity.TableLayoutActivity;


public class MainActivity extends AppCompatActivity {
    private int checked;
    CompoundButton.OnCheckedChangeListener rb = new CompoundButton.OnCheckedChangeListener() {
        @Override
        public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
            if (b){
                checked = compoundButton.getId();
            }
        }
    };
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        RadioButton btn_1 = findViewById(R.id.btn1);
        RadioButton btn_2 = findViewById(R.id.btn2);
        RadioButton btn_3 = findViewById(R.id.btn3);
        btn_1.setOnCheckedChangeListener(rb);
        btn_2.setOnCheckedChangeListener(rb);
        btn_3.setOnCheckedChangeListener(rb);
        Button btn = findViewById(R.id.bnt_submit);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                int id = view.getId();
                if (checked == R.id.btn1) {
                    intent.setClass(MainActivity.this, LinearLayoutActivity.class);
                    MainActivity.this.startActivity(intent);
                } else if (checked == R.id.btn2) {
                    intent.setClass(MainActivity.this, TableLayoutActivity.class);
                    MainActivity.this.startActivity(intent);
                } else if (checked == R.id.btn3) {
                    intent.setClass(MainActivity.this, FrameLayoutActivity.class);
                    MainActivity.this.startActivity(intent);
                } else {
                    Log.d("btn", "onClick: btn");
                }
            }
        });
    }
}