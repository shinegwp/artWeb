package com.art.service;

import java.util.List;

import com.art.pojo.Parent;
import com.art.util.EUDataGridResult;

public interface ParentService {
public List<Parent> getParents();

public EUDataGridResult getParrentListByPage(int parseInt, int parseInt2);
}
