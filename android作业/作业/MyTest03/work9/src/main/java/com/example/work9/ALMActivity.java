package com.example.work9;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Bundle;

import java.io.IOException;

public class ALMActivity extends AppCompatActivity {
    private MediaPlayer mp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_almactivity);

        try {
            AudioManager audioManager = (AudioManager) getSystemService(AUDIO_SERVICE);
            if (audioManager.getStreamVolume(AudioManager.STREAM_ALARM)!=0){
                mp = MediaPlayer.create(this, R.raw.getup);
                mp.setLooping(true);
                mp.start();
            }

            new AlertDialog.Builder(ALMActivity.this).setTitle("闹钟").setMessage("起床啦! ")
                    .setPositiveButton("确定!", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialoh, int i) {
                            mp.release();
                            ALMActivity.this.finish();
                        }
                    }).show();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void onStop() {
        mp.release();
        super.onStop();
    }

}