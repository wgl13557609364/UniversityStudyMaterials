package com.example.work16;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;

public class MainActivity extends AppCompatActivity {

    private RadioButton radioButton1, radioButton2, radioButton3;
    private Button button;
    private SitesDBHlp dbHlp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (dbHlp == null) {
            dbHlp = new SitesDBHlp(this);
            dbHlp.fillDB();
        }
        radioButton1 = findViewById(R.id.radioButton1);
        radioButton2 = findViewById(R.id.radioButton2);
        radioButton3 = findViewById(R.id.radioButton3);
        button = findViewById(R.id.button);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                if (radioButton1.isChecked()) {
                    intent.setClass(MainActivity.this, ADDActivity.class);
                    startActivity(intent);
                } else if (radioButton2.isChecked()) {
                    intent.setClass(MainActivity.this, QRYActivity.class);
                    startActivity(intent);
                } else if (radioButton3.isChecked()) {
                    intent.setClass(MainActivity.this, MNGAActivity.class);
                    startActivity(intent);
                }
            }
        });
    }
}