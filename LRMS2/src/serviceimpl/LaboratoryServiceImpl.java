package serviceimpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.LaboratoryDao;
import service.LaboratoryService;
import entity.Laboratory;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class LaboratoryServiceImpl implements LaboratoryService {
	@Autowired
	private LaboratoryDao laboratoryDao;
	
	@Override
	public int addLab(Laboratory laboratory) {
		System.out.println("LaboratoryServiceImpl - addLab");
		int result=(int)laboratoryDao.addLab(laboratory);
		return result;
	}

	@Override
	public List<Laboratory> getAllLab() {
		List<Laboratory> labList=laboratoryDao.getAllLab();
		return labList;
	}

	@Override
	public boolean delLab(Laboratory laboratory) {
		boolean isDel=laboratoryDao.delLab(laboratory);
		return isDel;
	}

	@Override
	public Laboratory getLabById(Laboratory laboratory) {
		Laboratory lab=laboratoryDao.getLabById(laboratory);
		return lab;
	}

	@Override
	public boolean updateLab(Laboratory laboratory) {
		boolean isUpdate=laboratoryDao.updateLab(laboratory);
		return isUpdate;
	}
}
