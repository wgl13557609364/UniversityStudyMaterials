package com.example.work10;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    private Spinner spm;
    private Button btok;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        spm = (Spinner) findViewById(R.id.spm);
        btok = (Button) findViewById(R.id.btok);

        btok.setOnClickListener(new View.OnClickListener() {
            Intent intent = new Intent();
            @Override
            public void onClick(View view) {
                  if(spm.getSelectedItemPosition()==0){
                      intent.setClass(MainActivity.this,SP1Activity.class);
                      MainActivity.this.startActivity(intent);
                  } else if (spm.getSelectedItemPosition()==1) {
                      intent.setClass(MainActivity.this,SP2Activity.class);
                      MainActivity.this.startActivity(intent);
                  }
            }
        });
    }
}