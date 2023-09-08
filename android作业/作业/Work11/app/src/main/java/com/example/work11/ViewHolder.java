package com.example.work11;

import android.view.ViewGroup;

import androidx.annotation.NonNull;

public interface ViewHolder {
    @NonNull
    int getItemCount();

    RecycleActivity.MemberAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType);

    void onBindViewHolder(@NonNull RecycleActivity.MemberAdapter.ViewHolder holder, int position);
}
