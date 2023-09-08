package com.example.work16;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class ADDActivity extends AppCompatActivity {
    private EditText etId;
    private EditText etName;
    private EditText etPhoneNo;
    private EditText etAddress;
    private Button btnInsert;
    private Button btnClear;
    private SitesDBHlp dbHlp;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_addactivity);

        etId = (EditText) findViewById(R.id.etId);
        etName = (EditText) findViewById(R.id.etName);
        etPhoneNo = (EditText) findViewById(R.id.etPhoneNo);
        etAddress = (EditText) findViewById(R.id.etAddress);
        btnInsert = (Button) findViewById(R.id.btnInsert);
        btnClear = (Button) findViewById(R.id.btnClear);

        btnInsert.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String id = etId.getText().toString().trim();
                String name = etName.getText().toString().trim();
                String phoneNo = etPhoneNo.getText().toString().trim();
                String address = etAddress.getText().toString().trim();
                if (id.length() <= 0 || name.length() <= 0) {
                    Toast.makeText(ADDActivity.this, "请输入ID: ",
                            Toast.LENGTH_SHORT).show();
                    return;
                }
                StringBuilder sb = new StringBuilder();
                Site site = new Site(id, name, phoneNo, address);
                long rowId = dbHlp.insertDB(site);
                if (rowId != -1) {
                    sb.append("插入成功! ");
                } else {
                    sb.append("插入失败! ");
                }
                Toast.makeText(ADDActivity.this, sb,
                        Toast.LENGTH_SHORT).show();
            }
        });
        btnClear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                etId.setText("");
                etName.setText("");
                etPhoneNo.setText("");
                etAddress.setText("");
            }
        });


    }

    @Override
    public void onResume() {
        super.onResume();
        if (dbHlp == null) {
            dbHlp = new SitesDBHlp(this);
        }
    }

    @Override
    public void onPause() {
        super.onPause();
        if (dbHlp != null) {
            dbHlp.close();
            dbHlp = null;
        }
    }
}