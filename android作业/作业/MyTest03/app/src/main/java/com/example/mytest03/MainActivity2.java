package com.example.mytest03;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity2 extends AppCompatActivity {

    private TextView user_name;
    private CheckBox checkBox;
    private CheckBox checkBox2;
    private CheckBox checkBox3;
    private Button allogin_bt;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        user_name = findViewById(R.id.user_name);
        Intent intent = getIntent();
        user_name.setText(intent.getStringExtra("username"));

        String selectuser_name = intent.getStringExtra("username");
        checkBox = findViewById(R.id.checkBox);
        checkBox2 = findViewById(R.id.checkBox2);
        checkBox3 = findViewById(R.id.checkBox3);
        allogin_bt = findViewById(R.id.allogin_bt);

        RadioGroup radioGroup = findViewById(R.id.radioGroup);
        radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int i) {
                RadioButton radioButton = findViewById(i);
                String selectedValue = radioButton.getText().toString();
                Toast.makeText(MainActivity2.this, "您选择了：" + selectedValue, Toast.LENGTH_SHORT).show();
            }
        });

        allogin_bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                RadioButton radioButton = findViewById(radioGroup.getCheckedRadioButtonId());
                String selectuser_sex = radioButton.getText().toString();
                String favor = "";
                String info = "";
                if(checkBox.isChecked()) favor += checkBox.getText().toString();
                if(checkBox2.isChecked()) favor += checkBox2.getText().toString();
                if(checkBox3.isChecked()) favor += checkBox3.getText().toString();
                info = "用户名："+selectuser_name+" "+"性别："+selectuser_sex+" "+"爱好："+favor;
                Toast.makeText(MainActivity2.this,info,Toast.LENGTH_SHORT).show();
            }
        });


    }
}