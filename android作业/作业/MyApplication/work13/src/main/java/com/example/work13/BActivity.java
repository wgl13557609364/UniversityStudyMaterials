package com.example.work13;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.telephony.SmsMessage;
import android.telephony.TelephonyManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BActivity extends AppCompatActivity {
    private String result;
    private TextView tv_msg;
    private EditText edt_num;
    private EditText edt_msg;
    private Button bt_send;
    private static final String BROADCAST_ACTION = "android.provider.Telephony.SMS_RECEIVED";
    private SmsReceiver smsReceiver;
    private IntentFilter intentFilter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bactivity);
        tv_msg = findViewById(R.id.tv_msg);
        edt_num = findViewById(R.id.edt_num);
        edt_msg = findViewById(R.id.edt_msg);
        bt_send = findViewById(R.id.bt_send);

        intentFilter = new IntentFilter(BROADCAST_ACTION);
        smsReceiver = new SmsReceiver();
        registerReceiver(smsReceiver, intentFilter);

        bt_send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String phone_number = edt_num.getText().toString().trim();
                String sms_content = edt_msg.getText().toString().trim();
                if (phone_number.length() == 0) {
                    Toast.makeText(BActivity.this, "请输入米信手机号!", Toast.LENGTH_SHORT).show();

                } else {
                    SmsManager smsManager = SmsManager.getDefault();
                    if (sms_content.length() > 70) {
                        ArrayList<String> contents = smsManager.divideMessage(sms_content);
                        for (String sms : contents) {
                            smsManager.sendTextMessage(phone_number, null, sms, null, null);

                        }
                    } else {
                        smsManager.sendTextMessage(phone_number, null, sms_content, null, null);
                        Toast.makeText(BActivity.this, "短信已发送!", Toast.LENGTH_SHORT).show();

                    }
                }
            }
        });


    }


    class SmsReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {

            Bundle bundle = intent.getExtras();
            SmsMessage msg = null;
            tv_msg.setText("");
            result = "";
            if (null != bundle) {
                Object[] smsObj = (Object[]) bundle.get("pdus");
                for (Object object : smsObj) {
                    msg = SmsMessage.createFromPdu((byte[]) object);
                    Date date = new Date(msg.getTimestampMillis());
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String receiveTime = format.format(date);
                    result += "\n number: " + msg.getOriginatingAddress()
                            + "\n body: " + msg.getDisplayMessageBody()
                            + "\n time: " + receiveTime;
                }
                Toast.makeText(context, result, Toast.LENGTH_SHORT).show();
                tv_msg.setText(result);
            }
        }
    }

    @Override
    protected void onDestroy() {
        unregisterReceiver(smsReceiver);
        super.onDestroy();
    }
}