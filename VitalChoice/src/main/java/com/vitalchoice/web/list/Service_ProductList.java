package com.vitalchoice.web.list;

import java.util.ArrayList;

import com.vitalchoice.web.product.ProductDTO;

public interface Service_ProductList {
	public ArrayList<ProductDTO> getLatest(PageDTO pagedto);
	public ArrayList<String> getThumb();
	public int getCntList();
	public ArrayList<ProductDTO> getSellCount(PageDTO pagedto);
	public ArrayList<ProductDTO> getLow(PageDTO pagedto);
	public ArrayList<ProductDTO> getHigh(PageDTO pagedto);
	public ArrayList<ProductDTO> getLike(PageDTO pagedto);
	public String getListTitle(int parseInt);
	public ArrayList<ProductDTO> getLatestPerCate(PageDTO pagedto, int i);
	public ArrayList<ProductDTO> getSellCountPerCate(PageDTO pagedto, int i);
	public ArrayList<ProductDTO> getLowPerCate(PageDTO pagedto, int i);
	public ArrayList<ProductDTO> getHighPerCate(PageDTO pagedto, int i);
	public ArrayList<ProductDTO> getLikePerCate(PageDTO pagedto, int i);
	public int getCntListPerCate(int parseInt);
	public ArrayList<ProductDTO> getLatestSearch(PageDTO pagedto, String keyword_searching);
	public int getCntListSearch(String keyword_searching);
	public ArrayList<ProductDTO> getSellCountSearch(PageDTO pagedto, String keyword_searching);
	public ArrayList<ProductDTO> getLowSearch(PageDTO pagedto, String keyword_searching);
	public ArrayList<ProductDTO> getHighSearch(PageDTO pagedto, String keyword_searching);
	public ArrayList<ProductDTO> getLikeSearch(PageDTO pagedto, String keyword_searching);
}