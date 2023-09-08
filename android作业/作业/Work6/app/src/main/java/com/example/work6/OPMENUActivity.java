package com.example.work6;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

public class OPMENUActivity extends MainActivity{
    private TextView poptv;
    @Override
    protected void  onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_opm);
        poptv=(TextView) findViewById(R.id.optv);

    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.opmenu,menu);
        return true;
    }

@Override
public boolean onOptionsItemSelected(MenuItem item){
    int id=item.getItemId();
    if (id ==R.id.majormenu1||id ==R.id.majormenu3){
        poptv.setText("你选择了计算机系计算机应用专业");
        return true;

    }
    else if(id ==R.id.majormenu2||id ==R.id.majormenu4){
        poptv.setText("你选择了计算机系软件技术专业");
        return true;
    }
    return super.onOptionsItemSelected(item);
}
}
