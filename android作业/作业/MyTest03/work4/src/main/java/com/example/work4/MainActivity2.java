package com.example.work4;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;

public class MainActivity2 extends AppCompatActivity {

    private Button bt;
    private RadioButton rb1,rb2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        bt = findViewById(R.id.bt);
        rb1 = findViewById(R.id.rb1);
        rb2 = findViewById(R.id.rb2);

        bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                if(rb1.isChecked()){
                    intent.setClass(MainActivity2.this,SkbActivity.class);
                    startActivity(intent);
                } else if (rb2.isChecked()) {
                    intent.setClass(MainActivity2.this,ImgActivity.class);
                    startActivity(intent);
                }
            }
        });
    }
}