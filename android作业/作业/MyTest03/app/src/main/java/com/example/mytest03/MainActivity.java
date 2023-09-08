package com.example.mytest03;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private EditText login_user;
    private EditText login_pass;
    private Button login_bt;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        login_user = findViewById(R.id.login_user);
        login_pass = findViewById(R.id.login_pass);
        login_bt = findViewById(R.id.login_bt);



        login_pass.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

                if(charSequence.length() >6 ){
                    login_pass.setText("");
                    Toast.makeText(MainActivity.this,"输入的密码超过六位！",Toast.LENGTH_SHORT).show();
                }

            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        login_bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String result = "user:"+login_user.getText()+" "+"password:"+login_pass.getText();
                Toast.makeText(MainActivity.this,result,Toast.LENGTH_SHORT).show();

            }
        });

        login_bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String account = login_user.getText().toString();
                String password = login_pass.getText().toString();
                if ( TextUtils.isEmpty(account) || TextUtils.isEmpty(password) ) {
                    Toast.makeText(MainActivity.this,"账号或密码为空！",Toast.LENGTH_SHORT).show();
                }  else {
                    Intent intent = new Intent(MainActivity.this,MainActivity2.class);
                    intent.putExtra("username",login_user.getText().toString());
                    startActivity(intent);
                }
            }
        });

    }
}