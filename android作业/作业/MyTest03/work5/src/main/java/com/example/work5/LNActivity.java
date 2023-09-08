package com.example.work5;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

public class LNActivity extends AppCompatActivity {

    private Button btset;
    private LinearLayout lnly;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lnactivity);

        btset = (Button) findViewById(R.id.lna_bt);
        lnly = (LinearLayout) findViewById(R.id.lna_lnly);

        btset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(lnly.getOrientation() == LinearLayout.VERTICAL){
                    lnly.setOrientation(LinearLayout.HORIZONTAL);
                } else if (lnly.getOrientation() == LinearLayout.HORIZONTAL) {
                    lnly.setOrientation(LinearLayout.VERTICAL);
                }
            }
        });
    }
}