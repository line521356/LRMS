package dao;

import java.util.List;

import entity.Laboratory;

public interface LaboratoryDao {
	public int addLab(Laboratory laboratory);

	public List<Laboratory> getAllLab();

	public boolean delLab(Laboratory laboratory);

	public Laboratory getLabById(Laboratory laboratory);

	public boolean updateLab(Laboratory laboratory);
}
