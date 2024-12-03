package com.kc.thanks.chap.mapper;

import com.kc.thanks.chap.common.Page;
import com.kc.thanks.chap.entity.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {
    void saveReply(Reply reply);

    List<Reply> findAll(@Param("page") Page page, String searchByName);

    int countAll(String searchByName);

    String selectPasswordById(int postId);

    void deletePost(int postId);

    List<Reply> selectRepliesByName(String name);

}