package com.example.work11;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;

public class WBVActivity extends AppCompatActivity {

    private WebView wbvw;
    private Button btn_go,btn_back;
    private EditText uritxt;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_wbvactivity);
        wbvw = findViewById(R.id.wbvw);
        btn_go = findViewById(R.id.btn_go);
        btn_back = findViewById(R.id.btn_back);
        uritxt = findViewById(R.id.uritxt);
        wbvw.requestFocus();
        wbvw.getSettings().setJavaScriptEnabled(true);
        wbvw.getSettings().setDomStorageEnabled(true);
        wbvw.loadUrl("https://www.baidu.com/");
        wbvw.setWebViewClient(new WebViewClient(){
            @Override
            public boolean shouldOverrideUrlLoading(WebView view,String url){
                if(url == null){
                    return false;
                }try {
                    if(url.startsWith("weixin://")||url.startsWith("alipays://")){
                        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                        startActivity(intent);
                        return true;
                    }
                }catch (Exception e){
                    return false;
                }
                view.loadUrl(url);
                return true;
            }
        });
        btn_go.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                wbvw.loadUrl("http://"+uritxt.getText().toString().trim());
            }
        });

        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                wbvw.goBack();
            }
        });
    }
}