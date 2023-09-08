package com.example.work11;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;

public class MainActivity extends AppCompatActivity {

    private RadioButton main_rb1,main_rb2,main_rb3;
    private Button main_bt;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        main_rb1 = findViewById(R.id.main_rb1);
        main_rb2 = findViewById(R.id.main_rb2);
        main_rb3 = findViewById(R.id.main_rb3);
        main_bt = findViewById(R.id.main_bt);

        main_bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                if(main_rb1.isChecked()){
                    intent.setClass(MainActivity.this,GDActivity.class);
                    startActivity(intent);
                } else if (main_rb2.isChecked()) {
                    intent.setClass(MainActivity.this,RCVActivity.class);
                    startActivity(intent);
                } else if (main_rb3.isChecked()) {
                    intent.setClass(MainActivity.this,WBVActivity.class);
                    startActivity(intent);
                }
            }
        });
    }
}