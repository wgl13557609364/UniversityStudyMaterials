package com.example.work10;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

public class SP2Activity extends AppCompatActivity {

    private TextView tv;
    private Spinner sp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sp2);

        tv=(TextView) findViewById(R.id.tv_c);
        sp=(Spinner) findViewById(R.id.sp_c);

        sp.setAdapter(new MemberAdapter(this));
        sp.setSelection(0,false);
        sp.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                 Member member = (Member) parent.getItemAtPosition(position);
                 tv.setText("您选择了"+member.getName());
                 Toast.makeText(SP2Activity.this,member.getName(),Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
    }
}