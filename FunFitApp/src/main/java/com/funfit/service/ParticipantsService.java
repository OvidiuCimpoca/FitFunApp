package com.funfit.service;

import java.util.List;

import com.funfit.bean.Participants;
import com.funfit.dao.ParticipantsDao;

public class ParticipantsService {
	
	ParticipantsDao pd = new ParticipantsDao();
	
	public String addParticipants(Participants participants) {
		if(pd.addParticipants(participants)>0) {
			return "Participants Details added successfully!";
		}else {
			return "Participants Details failed to add!";
		}
	}

	public String updateParticipants(Participants participants) {
		if(pd.updateParticipants(participants)>0) {
			return "Participants Details updated successfully!";
		}else {
			return "Participants Details failed to update!";
		}
	}

	public String deleteParticipants(Participants participants) {
		if(pd.deleteParticipants(participants)>0) {
			return "Participants Details updated successfully!";
		}else {
			return "Participants Details failed to update!";
		}
	}
	
	public List<Participants> viewAllParticipants() {
		return pd.viewAllParticipants();
	}

}
