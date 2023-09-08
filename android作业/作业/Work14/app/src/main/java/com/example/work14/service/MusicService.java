package com.example.work14.service;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.os.IBinder;
import android.os.ParcelUuid;

import androidx.annotation.Nullable;
import androidx.annotation.PluralsRes;

import com.example.work14.MainActivity;

import java.io.IOError;
import java.io.IOException;
import java.security.PublicKey;
import java.util.Timer;
import java.util.TimerTask;

public class MusicService extends Service {
    public static final String MUSICBOX_ACTION = "com.example.work14.MUSICBOX_ACTION";

    public static final String MUSICSERVICE_ACTION = "com.example.work14.MUSICSERVICE_ACTION";

    public static final int STATE_NON = 0X100;

    public static final int STATE_PLAY = 0X101;

    public static final int STATE_PAUSE = 0X102;

    public static final int STATE_STOP = 0X103;

    public static final int STATE_PREVIOUS = 0X104;

    public static final int STATE_NEXT = 0X105;

    private TimerTask mTimerTask;

    private Timer mTimer;

    public static boolean isChanging = false;

    public static MediaPlayer mediaPlayer;

    private AssetManager assetManager;

    String[] musics = new String[]{"小苹果.mp3", "父亲.mp3", "突然好想你.mp3","老男孩.mp3"};

    public static int current;

    private int state = STATE_NON;

    private boolean isTimerRunning = false;

    private MusicServiceReceiver receiver;

    private IntentFilter filter;

    public void onCreate() {
        super.onCreate();

        receiver = new MusicServiceReceiver();
        filter = new IntentFilter();
        filter.addAction(MUSICSERVICE_ACTION);
        registerReceiver(receiver, filter);
        mediaPlayer = new MediaPlayer();
        assetManager = getAssets();
        current = 0;
        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {
                current++;
                prepareAndPlay(current);
            }
        });
    }

    protected void prepareAndPlay(int index) {
        if (isTimerRunning) {
            mTimerTask.cancel();
            isTimerRunning = false;
        }
        if (index > musics.length - 1) {
            current = index = 0;
        }
        if (index < 0) {
            current = index = musics.length - 1;
        }
        Intent intent = new Intent();
        intent.putExtra("current", index);
        intent.setAction(MUSICBOX_ACTION);
        sendBroadcast(intent);

        try {
            AssetFileDescriptor assetFileDescriptor = assetManager.openFd(musics[current]);
            mediaPlayer.reset();
            mediaPlayer.setDataSource(assetFileDescriptor.getFileDescriptor(),
                    assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
            mediaPlayer.prepare();
            mediaPlayer.start();
            MainActivity.skbMusic.setMax(mediaPlayer.getDuration());
        } catch (IOException e) {
            e.printStackTrace();
        }
        mTimer=new Timer();
        mTimerTask=new TimerTask() {
            @Override
            public void run() {
                isTimerRunning=true;
                if (isChanging){
                    return;
                }
//                MainActivity.skbMusic.setProgress(mediaPlayer.getDuration());
                MainActivity.skbMusic.setProgress(mediaPlayer.getCurrentPosition());

            }
        };
        mTimer.schedule(mTimerTask,0,10);
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    class MusicServiceReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            int control = intent.getIntExtra("control", -1);
            switch (control) {
                case STATE_PLAY:
                    if (state == STATE_PAUSE) {
                        mediaPlayer.start();
                    } else if (state != STATE_PLAY) {
                        prepareAndPlay(current);
                    }
                    state = STATE_PLAY;
                    break;
                case STATE_PAUSE:
                    if (state == STATE_PLAY) {
                        mediaPlayer.pause();
                        state = STATE_PAUSE;
                    }
                    break;
                case STATE_STOP:
                    if (state == STATE_PLAY || state == STATE_PAUSE) {
                        state = STATE_STOP;
                        mediaPlayer.seekTo(0);
                        mediaPlayer.stop();
                    }
                    break;
                case STATE_PREVIOUS:
                    prepareAndPlay(--current);
                    state = STATE_PLAY;
                    break;
                case STATE_NEXT:
                    prepareAndPlay(++current);
                    state = STATE_PLAY;
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    public void onDestroy() {
        unregisterReceiver(receiver);
        mTimerTask.cancel();
        mediaPlayer.release();
        super.onDestroy();
    }
}
