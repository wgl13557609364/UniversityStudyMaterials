package com.example.work7;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;

public class MainActivity extends AppCompatActivity {
    private RadioButton radioButton1, radioButton2, radioButton3;
    private Button button;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        radioButton1 = findViewById(R.id.radioButton1);
        radioButton2 = findViewById(R.id.radioButton2);
        button = findViewById(R.id.button);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                if (radioButton1.isChecked()) {
                    intent.setClass(MainActivity.this, TouchActivity.class);
                    startActivity(intent);
                } else if (radioButton2.isChecked()) {
                    intent.setClass(MainActivity.this, GesturesActivity.class);
                    startActivity(intent);
                }
            }
        });

    }
}