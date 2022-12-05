package com.smhrd.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@RequiredArgsConstructor

public class Board {
	@NonNull
	private int num;
	@NonNull
	private String name;
	@NonNull
	private String writer;
	private String filename;
	private String content; 
	private String address;
	@NonNull
	private Timestamp uploadday;
	
	public Board(String name, String writer, String filename, String content, String address) {
		this.name = name;
		this.writer = writer;
		this.filename = filename;
		this.content = content;
		this.address = address;
}
}
