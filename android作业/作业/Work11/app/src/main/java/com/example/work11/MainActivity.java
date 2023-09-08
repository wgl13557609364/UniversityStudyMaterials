package com.example.work11;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.RadioButton;



public class MainActivity extends AppCompatActivity {
    private int checked;
    CompoundButton.OnCheckedChangeListener rb = new CompoundButton.OnCheckedChangeListener() {
        @Override
        public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
            if (b) {
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
        btn.setOnClickListener(view -> {
            Intent intent = new Intent();
            if (checked == R.id.btn1) {
                intent.setClass(MainActivity.this, GridActivity.class);
                startActivity(intent);
            } else if (checked == R.id.btn2) {
                intent.setClass(MainActivity.this, RecycleActivity.class);
                startActivity(intent);
            } else if (checked == R.id.btn3) {
                intent.setClass(MainActivity.this, WebActivity.class);
                startActivity(intent);
            }
        });
    }
}