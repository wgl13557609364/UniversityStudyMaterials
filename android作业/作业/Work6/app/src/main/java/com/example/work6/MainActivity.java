package com.example.work6;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;

public class MainActivity extends AppCompatActivity {
    Button bt;
    RadioButton rb1,rb2,rb3;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bt=findViewById(R.id.bt);
        rb1=findViewById(R.id.rb1);
        rb2=findViewById(R.id.rb2);
        rb3=findViewById(R.id.rb3);

        bt.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                Intent intent=new Intent();
                if (rb1.isChecked()){
                    intent.setClass(MainActivity.this,OPMENUActivity.class);
                    MainActivity.this.startActivity(intent);
                }
                else if(rb2.isChecked()){
                    intent.setClass(MainActivity.this,CTMENUActivity.class);
                    MainActivity.this.startActivity(intent);
                }
                else if(rb3.isChecked()){
                    intent.setClass(MainActivity.this,POPActivity.class);
                    MainActivity.this.startActivity(intent);
                }
            }
        });
    }
}