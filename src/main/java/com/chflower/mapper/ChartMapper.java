package com.chflower.mapper;

import com.chflower.dto.Chart;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ChartMapper extends CHMapper<Integer, Chart> {
    public List<Chart> subsamounttop10();
    public List<Chart> itemamounttop10();
    public List<Chart> subsamountworst10();
    public List<Chart> itemamountworst10();
    public Integer substotal(Chart chart);
    public Integer itemtotal(Chart chart);
}