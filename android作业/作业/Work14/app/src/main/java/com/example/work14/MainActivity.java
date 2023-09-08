package com.example.work14;

import android.app.ActivityManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.work14.service.MusicService;

public class MainActivity extends AppCompatActivity {

    public static final String MUSICBOX_ACTION = "com.example.work14.MUSICBOX_ACTION";

    public static final String MUSICSERVICE_ACTION = "com.example.work14.MUSICSERVICE_ACTION";

    public static final int STATE_NON = 0X100;

    public static final int STATE_PLAY = 0X101;

    public static final int STATE_PAUSE = 0X102;

    public static final int STATE_STOP = 0X103;

    public static final int STATE_PREVIOUS = 0X104;

    public static final int STATE_NEXT = 0X105;

    private int state;

    private Button btnPlayOrPause, btnPre, btnNext;
    public static SeekBar skbMusic;
    private TextView title, author;

    private String[] titleStrs = new String[]{"小苹果", "父亲", "突然好想你","老男孩"};
    private String[] authorStrs = new String[]{"筷子兄弟", "筷子兄弟", "五月天","筷子兄弟"};

    private boolean isPlaying = false;
    private MusicBoxReceiver mReceiver;
    private IntentFilter filter;
    private Intent intent;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        View.OnClickListener listener = new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int id = view.getId();
                if (id == R.id.btnNext) {
                    btnPlayOrPause.setText("暂停");
                    state = STATE_NEXT;
                    sendBroadcastToService(state);
                    isPlaying = true;
                } else if (id == R.id.btnPlayOrPause) {
                    if (!isPlaying) {
                        btnPlayOrPause.setText("暂停");
                        state = STATE_PLAY;
                        sendBroadcastToService(state);
                        isPlaying = true;
                    } else {
                        btnPlayOrPause.setText("播放");
                        state = STATE_PAUSE;
                        sendBroadcastToService(state);
                        isPlaying = false;
                    }
                } else if (id == R.id.btnPre) {
                    btnPlayOrPause.setText("暂停");
                    state = STATE_PREVIOUS;
                    sendBroadcastToService(state);
                    isPlaying = true;
                }
            }
        };
        SeekBar.OnSeekBarChangeListener sChangeListener = new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i, boolean b) {

            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
                MusicService.isChanging = false;
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                if (state != STATE_NON) {
                    MusicService.mediaPlayer.seekTo(seekBar.getProgress());
                } else seekBar.setProgress(0);
                MusicService.isChanging = false;
            }
        };

        skbMusic = findViewById(R.id.skbMusic);
        skbMusic.setOnSeekBarChangeListener(sChangeListener);

        btnNext=findViewById(R.id.btnNext);
        btnPlayOrPause = findViewById(R.id.btnPlayOrPause);
        btnPre = findViewById(R.id.btnPre);

        btnNext.setOnClickListener(listener);
        btnPlayOrPause.setOnClickListener(listener);
        btnPre.setOnClickListener(listener);

        title = findViewById(R.id.title);
        author = findViewById(R.id.author);

        mReceiver = new MusicBoxReceiver();
        filter = new IntentFilter();
        filter.addAction(MUSICBOX_ACTION);
        registerReceiver(mReceiver, filter);

        intent = new Intent(this, MusicService.class);

        ActivityManager manager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
        for (ActivityManager.RunningServiceInfo service : manager.getRunningServices(Integer.MAX_VALUE)) {
            if ("com.example.work14.service.MusicService".equals(service.service.getClassName()) && service.started) {
                skbMusic.setMax(MusicService.mediaPlayer.getDuration());
                skbMusic.setProgress(MusicService.mediaPlayer.getCurrentPosition());
                title.setText("歌名: "+titleStrs[MusicService.current]);
                author.setText("作者: "+authorStrs[MusicService.current]);
                state = STATE_PLAY;
            }
            if (MusicService.mediaPlayer.isPlaying()) {
                btnPlayOrPause.setText("暂停");
                isPlaying = true;
            }
            return;
        }
        title.setText("歌名: "+titleStrs[0]);
        author.setText("作者: "+authorStrs[0]);
        state = STATE_NON;
        startService(intent);



    }

    class MusicBoxReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            int current = intent.getIntExtra("current", -1);
            title.setText("歌名: "+titleStrs[current]);
            author.setText("作者: "+authorStrs[current]);
        }
    }

    protected void sendBroadcastToService(int state) {
        Intent intent = new Intent();
        intent.setAction(MUSICSERVICE_ACTION);
        intent.putExtra("control", state);
        sendBroadcast(intent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        menu.add(0, 1, 1, "停止");
        menu.add(0, 2, 2, "退出");
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == 1) {
            btnPlayOrPause.setText("播放");
            sendBroadcastToService(STATE_STOP);
            isPlaying = false;
        } else if (id == 2) {
            stopService(intent);
            this.finish();
        }
        return true;
    }

    @Override
    protected void onDestroy() {
        unregisterReceiver(mReceiver);
        super.onDestroy();
    }
}