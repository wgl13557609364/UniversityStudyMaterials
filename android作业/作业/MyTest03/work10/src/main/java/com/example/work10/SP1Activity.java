package com.example.work10;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;

public class SP1Activity extends AppCompatActivity {

    private Spinner sp1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sp1);

        sp1 = (Spinner) findViewById(R.id.sp1);

        String[] places = {"Australia","Switzerland","China","America"};

        ArrayAdapter<String> adapterPlace =
                new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item,places);

        adapterPlace.setDropDownViewResource(R.layout.txtlayout);

        sp1.setAdapter(adapterPlace);

        sp1.setOnItemSelectedListener(listener);
    }

    Spinner.OnItemSelectedListener listener = new Spinner.OnItemSelectedListener(){
        @Override
        public void onItemSelected(AdapterView parent, View view, int pos, long id){
            Toast.makeText(parent.getContext(),parent.getItemAtPosition(pos).toString(),Toast.LENGTH_SHORT).show();
        }

        @Override
        public void onNothingSelected(AdapterView parent){
            Toast.makeText(parent.getContext(),"Npthing Selected",Toast.LENGTH_SHORT).show();
        }
    };
}