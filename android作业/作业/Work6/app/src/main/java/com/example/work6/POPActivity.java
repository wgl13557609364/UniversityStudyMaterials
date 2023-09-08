package com.example.work6;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.zip.Inflater;

public class POPActivity extends MainActivity{
    private TextView poptv;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pop);

        poptv=(TextView) findViewById(R.id.poptv);
    }
    @Override
    public  boolean onPrepareOptionsMenu(Menu menu){
        String currentText=poptv.getText().toString();
        if("软件技术".equals(currentText)){
            menu.clear();
            menu.add(0,501,1,"软件一班");
            menu.add(0,502,2,"软件二班");
            menu.add(0,503,3,"软件三班");
            menu.add(0,504,4,"转到计算机应用菜单");

        }
        if("计算机应用".equals(currentText)){
            menu.clear();
            menu.add(0,601,1,"计算机应用一班");
            menu.add(0,602,2,"计算机应用二班");
            menu.add(0,603,3,"转到软件技术菜单");
        }
        return super.onPrepareOptionsMenu(menu);
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu){

        getMenuInflater().inflate(R.menu.po,menu);
        return true;

    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item){
        int id=item.getItemId();
        if(id==504){
            poptv.setText("计算机应用");
            return true;
        }
        else if(id==603){
            poptv.setText("软件技术");
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
