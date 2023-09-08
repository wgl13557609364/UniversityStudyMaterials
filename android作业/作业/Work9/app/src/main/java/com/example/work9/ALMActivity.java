package com.example.work9;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Environment;

public class ALMActivity extends AppCompatActivity {

    MediaPlayer mp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_almactivity);
        try {
            new AlertDialog.Builder(this).setTitle("闹钟").setMessage("起床了！")
                    .setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            mp.release();
                            ALMActivity.this.finish();
                        }
                    }).show();
            //读取SD卡的音乐
            mp=new MediaPlayer();
            mp.setDataSource(Environment.getExternalStorageDirectory().getPath()+"/Alarms/getup.mp3");
            AudioManager audioManager=(AudioManager)getSystemService(AUDIO_SERVICE);
            if (audioManager.getStreamVolume(AudioManager.STREAM_ALARM)!=0){
                mp.setAudioStreamType(AudioManager.STREAM_ALARM);
                mp.setLooping(true);
                mp.prepare();
                mp.start();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}