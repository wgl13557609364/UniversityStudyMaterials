package com.example.work4;

import androidx.appcompat.app.AppCompatActivity;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.os.Vibrator;
import android.widget.ImageView;

public class ImgActivity extends AppCompatActivity {

    private Sensor s;
    private SensorManager sm;
    private ImageView imgv;
    private int rate;
    private Vibrator vb;
    private SensorEventListener listener;
    int imgid[] = {R.drawable.img11,R.drawable.img22,R.drawable.img33};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_img);

        imgv = findViewById(R.id.imgv);
        sm = (SensorManager)getSystemService(SENSOR_SERVICE);
        vb = (Vibrator)getSystemService(VIBRATOR_SERVICE);
        s = sm.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        rate = SensorManager.SENSOR_DELAY_NORMAL;
        listener = new SensorEventListener() {
            @Override
            public void onSensorChanged(SensorEvent sensorEvent) {
                float x= sensorEvent.values[0];
                float y= sensorEvent.values[1];
                float z= sensorEvent.values[2];
                float f=15;
                int i = (int)(Math.random()*100)%3;
                if(Math.abs(x)>f||Math.abs(y)>f||Math.abs(z)>f){
                    vb.vibrate(1000);
                    imgv.setImageResource(imgid[i]);
                }
            }
            @Override
            public void onAccuracyChanged(Sensor sensor, int i) {

            }
        };
        sm.registerListener(listener,s,rate);
    }
    @Override
    protected void onDestroy(){
        vb.cancel();
        sm.unregisterListener(listener,s);
        super.onDestroy();
    }
}