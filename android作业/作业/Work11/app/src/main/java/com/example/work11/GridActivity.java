package com.example.work11;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageSwitcher;
import android.widget.ImageView;
import android.widget.ViewSwitcher;



public class GridActivity extends AppCompatActivity {
    GridView gdv;
    ImageSwitcher imsw;

    int imgId[] = {
            R.drawable.panda1,R.drawable.panda2,R.drawable.panda3,
            R.drawable.panda4,R.drawable.panda5,R.drawable.panda6,
            R.drawable.panda7,R.drawable.panda8,R.drawable.panda9,
    };

    class ImageAdapter extends BaseAdapter{
        LayoutInflater layoutInflater;
        Context context;
        public ImageAdapter(Context context){
            layoutInflater = LayoutInflater.from(context);
            this.context = context;
        }

        @Override
        public int getCount() {
            return imgId.length;
        }

        @Override
        public Object getItem(int posision) {
            return posision;
        }

        @Override
        public long getItemId(int posision) {
            return posision;
        }

        @Override
        public View getView(int posision, View converView, ViewGroup parent) {
            converView = layoutInflater.inflate(R.layout.gdv_item, parent, false);
            ImageView imageView = (ImageView) converView;
            imageView.setImageResource(imgId[posision]);
            return imageView;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_grid);
        gdv = findViewById(R.id.gdv);
        imsw  = findViewById(R.id.imsw);
        gdv.setAdapter(new ImageAdapter(this));
        imsw.setFactory(new ViewSwitcher.ViewFactory() {
            @Override
            public View makeView() {
                ImageView imageView = new ImageView(GridActivity.this);
                return imageView;
            }
        });
        imsw.setInAnimation(this, android.R.anim.fade_in);
        imsw.setOutAnimation(this, android.R.anim.fade_out);
        imsw.setImageResource(imgId[0]);
        gdv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int posision, long id) {
                imsw.setImageResource(imgId[posision]);
            }
        });
    }
}