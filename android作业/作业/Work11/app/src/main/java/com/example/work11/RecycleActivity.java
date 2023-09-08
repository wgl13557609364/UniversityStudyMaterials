package com.example.work11;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;


public class RecycleActivity extends AppCompatActivity {
    RecyclerView rcv;
    TextView tv_name;

    class MemberAdapter extends RecyclerView.Adapter<MemberAdapter.ViewHolder> {
        private Context context;
        private LayoutInflater layoutInflater;
        private List<Member> memberList;

        public MemberAdapter(Context context) {
            this.context = context;
            layoutInflater = LayoutInflater.from(context);

            memberList = new ArrayList<>();

            memberList.add(new Member("中国", R.drawable.cn));
            memberList.add(new Member("美国", R.drawable.us));
            memberList.add(new Member("英国", R.drawable.en));
            memberList.add(new Member("瑞士", R.drawable.sw));
        }

        public class ViewHolder extends RecyclerView.ViewHolder {
            private ImageView cv_iv;
            private TextView cv_tv;

            public ViewHolder(@NonNull View itemView) {
                super(itemView);
                cv_iv = itemView.findViewById(R.id.cv_iv);
                cv_tv = itemView.findViewById(R.id.cv_tv);
                itemView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (getAdapterPosition() == RecyclerView.NO_POSITION) return;
                        Member member = memberList.get(getAdapterPosition());
                        ImageView imageView = new ImageView(context);
                        imageView.setImageResource(member.getImgId());
                        tv_name.setText(member.getName());
                        Toast toast = new Toast(context);
                        toast.setView(imageView);
                        toast.setDuration(Toast.LENGTH_SHORT);
                        toast.show();

                    }
                });
            }

            public ImageView getCv_iv() {
                return cv_iv;
            }

            public TextView getCv_tv() {
                return cv_tv;
            }
        }

        @NonNull
        @Override
        public int getItemCount() {
            return memberList.size();
        }

        @Override
        public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            View itemView = layoutInflater.inflate(R.layout.rcv_cv_item, parent, false);
            return new ViewHolder(itemView);
        }

        @Override
        public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
            Member member = memberList.get(position);
            holder.getCv_iv().setImageResource(member.getImgId());
            holder.getCv_tv().setText(member.getName());
        }
    }
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_recycle);
            rcv = findViewById(R.id.rcv);
            tv_name = findViewById(R.id.tv_name);
            rcv.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false));
            rcv.setAdapter(new MemberAdapter(this));
        }



}