package com.example.work7;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class TouchActivity extends AppCompatActivity {
    private TextView tv_msg;
    private ImageView iv_touch;
    private GestureDetector gsdt;


    GestureDetector.OnGestureListener listener= new GestureDetector.OnGestureListener() {
        @Override
        public boolean onDown(@NonNull MotionEvent motionEvent) {
            return false;
        }

        @Override
        public void onShowPress(@NonNull MotionEvent motionEvent) {

        }

        @Override
        public boolean onSingleTapUp(@NonNull MotionEvent motionEvent) {
            Toast.makeText(TouchActivity.this,"单击抬起",Toast.LENGTH_SHORT).show();
            return false;
        }

        @Override
        public boolean onScroll(@NonNull MotionEvent motionEvent, @NonNull MotionEvent motionEvent1, float v, float v1) {
            return false;
        }

        @Override
        public void onLongPress(@NonNull MotionEvent motionEvent) {
            Toast.makeText(TouchActivity.this,"长按",Toast.LENGTH_SHORT).show();

        }

        @Override
        public boolean onFling(@NonNull MotionEvent motionEvent, @NonNull MotionEvent motionEvent1, float v, float v1) {
            Toast.makeText(TouchActivity.this,"滑屏",Toast.LENGTH_SHORT).show();
            return false;
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_touch);

        tv_msg=findViewById(R.id.tv_msg);
        iv_touch=findViewById(R.id.iv_touch);
        iv_touch.setFocusable(true);
        iv_touch.setClickable(true);
        iv_touch.setLongClickable(true);

        gsdt=new GestureDetector(listener);

        iv_touch.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent event) {
                tv_msg.setText("X="+event.getX()+"   Y="+event.getY());
                return gsdt.onTouchEvent(event);
            }
        });
    }
}