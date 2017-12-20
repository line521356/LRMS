package daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;






import dao.LaboratoryDao;
import entity.Laboratory;


@Repository
public class LaboratoryDaoImpl implements LaboratoryDao{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public int addLab(Laboratory laboratory) {
		Session session=sessionFactory.getCurrentSession();
		int result=(int)session.save(laboratory);
		return result;
	}

	@Override
	public List<Laboratory> getAllLab() {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer( "from Laboratory order by building_name");  
		Query query = session.createQuery(hql.toString());  
		return query.list();  
	}

	@Override
	public boolean delLab(Laboratory laboratory) {
		StringBuffer hql =new StringBuffer("delete Laboratory  where lab_id=?");  
	    Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());  
	    query.setInteger(0, laboratory.getLab_id());  
	    return (query.executeUpdate() > 0);  
	}

	@Override
	public Laboratory getLabById(Laboratory laboratory) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer( "from Laboratory where lab_id=?");  
		Query query = session.createQuery(hql.toString());  
		query.setInteger(0, laboratory.getLab_id());  
		return (Laboratory) query.uniqueResult();  
	}

	@Override
	public boolean updateLab(Laboratory laboratory) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer( "update Laboratory set building_name=?,room_number=?,person_number=?,is_free=?,description=? where lab_id=?");
		Query query = session.createQuery(hql.toString()); 
		query.setString(0, laboratory.getBuilding_name());  
		query.setInteger(1, laboratory.getRoom_number());  
		query.setInteger(2, laboratory.getPerson_number());  
		query.setInteger(3, laboratory.getIs_free());  
		query.setString(4, laboratory.getDescription());  
		query.setInteger(5, laboratory.getLab_id());  
		return (query.executeUpdate() > 0);
	}  
}
