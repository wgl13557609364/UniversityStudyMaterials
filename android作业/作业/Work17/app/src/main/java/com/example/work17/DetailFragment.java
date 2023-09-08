package com.example.work17;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
//import android.app.Fragment;
import androidx.fragment.app.Fragment;
//import androidx.fragment.app.Fragment;

public class DetailFragment extends Fragment {
    private int position;

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public DetailFragment(){}


    public DetailFragment(int position) {
        this.position = position;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState){
        super.onCreateView(inflater,container,savedInstanceState);
        if (container==null){
            return null;
        }
        View view = inflater.inflate(R.layout.detail_fragment, container, false);
        ImageView imageView = view.findViewById(R.id.imageView);
        imageView.setImageResource(Resort.Countrys[position].getImageId());
        TextView textView = view.findViewById(R.id.textView);
        textView.setText(Resort.Countrys[position].getDescription());
        return view;
    }
}
