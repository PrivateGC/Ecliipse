package com.bigdata.crud.dao;

import com.bigdata.crud.bean.Departmental;
import com.bigdata.crud.bean.DepartmentalExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartmentalMapper {
    long countByExample(DepartmentalExample example);

    int deleteByExample(DepartmentalExample example);

    int deleteByPrimaryKey(Integer bid);

    int insert(Departmental record);

    int insertSelective(Departmental record);

    List<Departmental> selectByExample(DepartmentalExample example);

    Departmental selectByPrimaryKey(Integer bid);

    int updateByExampleSelective(@Param("record") Departmental record, @Param("example") DepartmentalExample example);

    int updateByExample(@Param("record") Departmental record, @Param("example") DepartmentalExample example);

    int updateByPrimaryKeySelective(Departmental record);

    int updateByPrimaryKey(Departmental record);
}