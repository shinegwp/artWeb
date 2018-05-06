package com.art.service;

import java.util.List;

import com.art.util.EUTreeNode;

public interface ItemCatService {
List<EUTreeNode> getItemCatList(long parentId);
}
