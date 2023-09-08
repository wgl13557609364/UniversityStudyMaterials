package com.example.work6;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class CTMENUActivity extends AppCompatActivity {

    private TextView cttv;
    private Button btpush;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ctmenuactivity);

        cttv = (TextView) findViewById(R.id.cttv);
        btpush = (Button) findViewById(R.id.btpush);
        registerForContextMenu(btpush);
    }
    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo){
           getMenuInflater().inflate(R.menu.ctmenu,menu);
    }
    @Override
    public boolean onContextItemSelected(MenuItem item){
        int id = item.getItemId();
        if(id == R.id.apple){
            cttv.setText("你选择了苹果");
            return true;
        }
        else if(id == R.id.banana){
            cttv.setText("你选择了香蕉");
            return true;
        }
        else if(id == R.id.pear){
            cttv.setText("你选择了梨");
            return true;
        }
        else if(id == R.id.pitch){
            cttv.setText("你选择了桃子");
            return true;
        }
        return super.onContextItemSelected(item);
    }
}