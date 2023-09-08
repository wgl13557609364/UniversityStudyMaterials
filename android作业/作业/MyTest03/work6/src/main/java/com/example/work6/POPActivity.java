package com.example.work6;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

public class POPActivity extends AppCompatActivity {

    private TextView poptv;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_popactivity);
        poptv = (TextView) findViewById(R.id.poptv);
    }
    @Override
    public boolean onPrepareOptionsMenu(Menu menu){
        String currenText = poptv.getText().toString();
        if("软件技术".equals(currenText)){
            menu.clear();
            menu.add(0,501,1,"软件1班");
            menu.add(0,502,2,"软件2班");
            menu.add(0,503,3,"软件3班");
            menu.add(0,504,4,"转到计算机应用菜单");
        }
        if("计算机应用".equals(currenText)){
            menu.clear();
            menu.add(0,601,1,"软件1班");
            menu.add(0,602,2,"软件2班");
            menu.add(0,603,3,"转到软件技术菜单");
        }
        return super.onPrepareOptionsMenu(menu);
    }
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.po,menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item){
        int id = item.getItemId();
        if(id == 504){
            poptv.setText("计算机应用");
            return true;
        }
        else if(id == 603){
            poptv.setText("软件技术");
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}