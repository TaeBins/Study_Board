package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@RequiredArgsConstructor
public class Reply {

	private int num;
	
	@NonNull private int boardNum;
	@NonNull private String content;
	@NonNull private String writer;
	
}
