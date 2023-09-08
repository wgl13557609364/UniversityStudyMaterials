package com.example.work4;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;

import android.graphics.Color;
import android.os.Bundle;
import android.widget.SeekBar;
import android.widget.Toast;

public class SkbActivity extends AppCompatActivity {

    private ConstraintLayout c1;
    private SeekBar skb;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_skb);

        c1 = findViewById(R.id.c1);
        skb = findViewById(R.id.skb);
        skb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i, boolean b) {
                c1.setBackgroundColor(Color.rgb(i,i,i));
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                Toast.makeText(SkbActivity.this,skb.getProgress()+"",Toast.LENGTH_SHORT).show();
            }
        });
    }
}