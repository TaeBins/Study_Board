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

public class Member {
	@NonNull
	private String id;
	@NonNull
	private String pw;
	private String nick;
	

}
