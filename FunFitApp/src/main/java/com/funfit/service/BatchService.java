package com.funfit.service;

import java.util.List;

import com.funfit.bean.Batch;
import com.funfit.dao.BatchDao;

public class BatchService {
	
	BatchDao db = new BatchDao();
	public String addBatch(Batch batch) {
		if(db.addBatch(batch)>0) {
			return "Batch Details added successfully!";
		}else {
			return "Batch deatils failed to add!";
		}
	}

	public String updateBatch(Batch batch) {
		if(db.updateBatch(batch)>0) {
			return "Batch Details updated successfully!";
		}else {
			return "Batch Details failed to update!";
		}
	}

	public String deleteBatch(Batch batch) {
		if(db.deleteBatch(batch)>0) {
			return "Batch Details deleted successfully!";
		}else {
			return "Batch Details failed to delet!";
		}
	}
	
	public List<Batch> viewAllBatch(){
		return db.viewAllBatches();
	}
}
