package com.zeus.mapper;

import org.apache.ibatis.annotations.Param;

import com.zeus.domain.Member;

public interface MemberMapper {
	Member read(@Param("userId") String userId);
}