package daoimpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javafx.scene.control.Alert;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.hql.internal.ast.HqlASTFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;






















import dao.LaboratoryDao;
import dao.ReserveLaboratoryDao;
import entity.Laboratory;
import entity.Reservation;
import entity.Schedule;
import entity.lab_reservation;
import entity.lab_schedule;
import entity.user_lab_reservation;


@Repository
public class ReserveLaboratoryDaoImpl implements ReserveLaboratoryDao{
	@Autowired
	private SessionFactory sessionFactory;

	//reserve_type=1时
	@Override
	public int reserveLab(Reservation reservation) {
		Session session=sessionFactory.getCurrentSession();
		int result=0;	
		int time_interval=reservation.getTime_interval();
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String reserve_date=sdf1.format(reservation.getReserve_date());
		
		//判读是否schedule中已存在预约日期的信息
		StringBuffer hql =new StringBuffer("from Schedule where schedule_date='"+reserve_date+"' and "+" lab_id="+reservation.getLab_id());
		Query query = session.createQuery(hql.toString()); 
		List<Schedule> test_schedule_date_list=query.list();
		if(test_schedule_date_list.size()==0){
			StringBuffer hql1 =new StringBuffer("from Laboratory where lab_id=? and person_number>=? and is_free=0");
			Query query1 = session.createQuery(hql1.toString()); 
			query1.setInteger(0, reservation.getLab_id());
			query1.setInteger(1, reservation.getPerson_number());
			query1.list();
			if(query1.list().size()!=0){
				result=(int)session.save(reservation);
				
				//hql语句不能实现插入操作
				StringBuffer sql2 =new StringBuffer("insert into Schedule(lab_id,schedule_date,t1,t2,t3,t4,t5) values(?,?,");
				if(time_interval==1){
					sql2.append("?,0,0,0,0");
				}
				if(time_interval==2){
					sql2.append("0,?,0,0,0");
				}
				if(time_interval==3){
					sql2.append("0,0,?,0,0");
				}
				if(time_interval==4){
					sql2.append("0,0,0,?,0");
				}
				if(time_interval==5){
					sql2.append("0,0,0,0,?");
				}
				sql2.append(")");
				Query query2 = session.createSQLQuery(sql2.toString());
				query2.setInteger(0, reservation.getLab_id());
				query2.setDate(1, reservation.getReserve_date());
				query2.setInteger(2, reservation.getPerson_number());
				query2.executeUpdate();
			}
			
		}else{
//			StringBuffer hql3 =new StringBuffer("from Schedule as s,Laboratory as l where s.lab_id=? and s.schedule_date=? and l.person_number-");
			StringBuffer hql3=new StringBuffer("from Schedule as s,Laboratory as l where s.lab_id="+reservation.getLab_id()+" and s.schedule_date='"+reserve_date+"' and l.person_number-");
			if(time_interval==1){
				hql3.append("t1>=?");
			}
			if(time_interval==2){
				hql3.append("t2>=?");
			}
			if(time_interval==3){
				hql3.append("t3>=?");
			}
			if(time_interval==4){
				hql3.append("t4>=?");
			}
			if(time_interval==5){
				hql3.append("t5>=?");
			}
			hql3.append(" and s.lab_id=l.lab_id");
			Query query3 = session.createQuery(hql3.toString());
			query3.setInteger(0, reservation.getPerson_number());
			if(query3.list().size()!=0){
				result=(int)session.save(reservation);
				
				StringBuffer hql4 =new StringBuffer("update Schedule set ");
				if(time_interval==1){
					hql4.append("t1=t1+?");
				}
				if(time_interval==2){
					hql4.append("t2=t2+?");
				}
				if(time_interval==3){
					hql4.append("t3=t3+?");
				}
				if(time_interval==4){
					hql4.append("t4=t4+?");
				}
				if(time_interval==5){
					hql4.append("t5=t5+?");
				}
				hql4.append(" where schedule_date='"+reserve_date+"' and "+" lab_id="+reservation.getLab_id());
				Query query4 = session.createSQLQuery(hql4.toString());
				query4.setInteger(0, reservation.getPerson_number());
//				query4.setInteger(1, reservation.getLab_id());
//				query4.setString(2, "'"+reserve_date+"'");
				query4.executeUpdate();
			}
		}
		return result;
	}

	//查询该实验室已被预约的信息
	@Override
	public List<lab_reservation> getLab_reservations(int lab_id) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("select new entity.lab_reservation(l.lab_id,l.building_name,l.room_number,r.reserve_type,r.reserve_date,r.time_interval,"
				+"l.person_number-sum(r.person_number),l.is_free) "
				+"from Reservation as r , Laboratory as l where r.lab_id=? and r.lab_id=l.lab_id and r.reserve_date>=CURDATE()"
				+"GROUP BY r.reserve_date,r.time_interval ORDER BY r.reserve_date ASC");  
		Query query = session.createQuery(hql.toString());  
		query.setInteger(0, lab_id);
		List<lab_reservation> lab_reservation_list=query.list();
		return lab_reservation_list;
	}

	@Override
	public int reserveLab2(Reservation reservation) {
		Session session=sessionFactory.getCurrentSession();
		int result=0;	
		int time_interval=reservation.getTime_interval();
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String reserve_date=sdf1.format(reservation.getReserve_date());
		//判读是否schedule中已存在预约日期的信息
		StringBuffer hql =new StringBuffer("from Schedule where schedule_date='"+reserve_date+"' and "+" lab_id="+reservation.getLab_id());
		Query query = session.createQuery(hql.toString()); 
		List<Schedule> test_schedule_date_list=query.list();
		if(test_schedule_date_list.size()==0){
			StringBuffer hql1 =new StringBuffer("from Laboratory l where l.lab_id="+reservation.getLab_id()+" and l.person_number>=(select c.person_number from Course c where c.course_id="+reservation.getCourse_id()+") and l.is_free=0");
			Query query1 = session.createQuery(hql1.toString()); 
			query1.list();
			if(query1.list().size()!=0){
				StringBuffer sqlSave=new StringBuffer("insert into Reservation(lab_id,user_id,reserve_type,course_id,courseName,person_number,reserve_date,time_interval,weekday,description,create_time) values(?,?,?,?,"
						+"(select courseName from Course where course_id=?),"
						+"(select person_number from Course where course_id=?),"
						+"?,?,?,?,now())");
				Query querySave = session.createSQLQuery(sqlSave.toString());
				querySave.setInteger(0, reservation.getLab_id());
				querySave.setInteger(1, reservation.getUser_id());
				querySave.setInteger(2, reservation.getReserve_type());
				querySave.setInteger(3, reservation.getCourse_id());
				querySave.setInteger(4, reservation.getCourse_id());
				querySave.setInteger(5, reservation.getCourse_id());
				querySave.setDate(6, reservation.getReserve_date());
				querySave.setInteger(7, reservation.getTime_interval());
				querySave.setInteger(8, reservation.getWeekday());
				querySave.setString(9, reservation.getDescription());
//				querySave.setDate(10, reservation.getCreate_time());
				result=(int)querySave.executeUpdate();
				
				//hql语句不能实现插入操作
				StringBuffer sql2 =new StringBuffer("insert into Schedule(lab_id,schedule_date,t1,t2,t3,t4,t5) values(?,?,");
				if(time_interval==1){
					sql2.append("(select person_number from Laboratory where lab_id=?),0,0,0,0");
				}
				if(time_interval==2){
					sql2.append("0,(select person_number from Laboratory where lab_id=?),0,0,0");
				}
				if(time_interval==3){
					sql2.append("0,0,(select person_number from Laboratory where lab_id=?),0,0");
				}
				if(time_interval==4){
					sql2.append("0,0,0,(select person_number from Laboratory where lab_id=?),0");
				}
				if(time_interval==5){
					sql2.append("0,0,0,0,(select person_number from Laboratory where lab_id=?)");
				}
				sql2.append(")");
				Query query2 = session.createSQLQuery(sql2.toString());
				query2.setInteger(0, reservation.getLab_id());
				query2.setDate(1, reservation.getReserve_date());
				query2.setInteger(2, reservation.getLab_id());
				query2.executeUpdate();
			}
			
		}else{
			StringBuffer hql3=new StringBuffer("from Schedule as s,Laboratory as l where s.lab_id="+reservation.getLab_id()+" and s.schedule_date='"+reserve_date+"' and l.person_number>=(select person_number from Course where js_id="+reservation.getUser_id()+") and ");
			if(time_interval==1){
				hql3.append("t1=0");
			}
			if(time_interval==2){
				hql3.append("t2=0");
			}
			if(time_interval==3){
				hql3.append("t3=0");
			}
			if(time_interval==4){
				hql3.append("t4=0");
			}
			if(time_interval==5){
				hql3.append("t5=0");
			}
			hql3.append(" and s.lab_id=l.lab_id");
			Query query3 = session.createQuery(hql3.toString());
			if(query3.list().size()!=0){
				result=(int)session.save(reservation);
				
				StringBuffer hql4 =new StringBuffer("update Schedule set ");
				if(time_interval==1){
					hql4.append("t1=t1+?");
				}
				if(time_interval==2){
					hql4.append("t2=t2+?");
				}
				if(time_interval==3){
					hql4.append("t3=t3+?");
				}
				if(time_interval==4){
					hql4.append("t4=t4+?");
				}
				if(time_interval==5){
					hql4.append("t5=t5+?");
				}
				hql4.append(" where schedule_date='"+reserve_date+"' and "+" lab_id="+reservation.getLab_id());
				Query query4 = session.createSQLQuery(hql4.toString());
				query4.setInteger(0, reservation.getPerson_number());
				query4.executeUpdate();
			}
		}
		return result;
	}

	@Override
	public List<lab_schedule> getSchedule_table(int lab_id) {
		List<lab_schedule> list=new ArrayList<lab_schedule>();
		for(int i=0;i<15;i++){
//		for(int i=-14;i<=0;i++){
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		    Calendar c = Calendar.getInstance();
//		    System.out.println("今天： "+sf.format(c.getTime()));
		    
		    c.add(Calendar.DAY_OF_MONTH, i);
		    String selectdate=sf.format(c.getTime());
			lab_schedule labSchedule;
			try {
				labSchedule = getScheduleByDate(selectdate,lab_id);
				list.add(labSchedule);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//获取今天的数据
			
		}
		return list;
	}
	public lab_schedule getScheduleByDate(String selectdate,int lab_id) throws ParseException{
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("from Schedule where lab_id="+lab_id+" and schedule_date='"+selectdate+"'");
		Query query = session.createQuery(hql.toString()); 
		if(query.list().size()==0){
			StringBuffer hql1 =new StringBuffer("select new entity.lab_schedule(lab_id,building_name,room_number,person_number) "
					+"from Laboratory where lab_id="+lab_id);
			Query query1 = session.createQuery(hql1.toString());
			lab_schedule labSchedule=(lab_schedule)query1.uniqueResult();
			
			int person_number=labSchedule.getPerson_number();
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
			java.util.Date date=sdf.parse(selectdate); 
			
			labSchedule.setSchedule_date(date);
			labSchedule.setT1(0);
			labSchedule.setT1_free(person_number);
			labSchedule.setT2(0);
			labSchedule.setT2_free(person_number);
			labSchedule.setT3(0);
			labSchedule.setT3_free(person_number);
			labSchedule.setT4(0);
			labSchedule.setT4_free(person_number);
			labSchedule.setT5(0);
			labSchedule.setT5_free(person_number);
			
			return labSchedule;
		}else{
			StringBuffer hql2 =new StringBuffer("select new entity.lab_schedule(l.lab_id,l.building_name,l.room_number,l.person_number,s.schedule_date,"
					+"s.t1,l.person_number-s.t1,s.t2,l.person_number-s.t2,s.t3,l.person_number-s.t3,s.t4,l.person_number-s.t4,s.t5,l.person_number-s.t5) "
					+"from Laboratory l,Schedule s "
					+"where s.lab_id="+lab_id+" and s.schedule_date='"+selectdate+"' and s.lab_id=l.lab_id");
			Query query2 = session.createQuery(hql2.toString());
			lab_schedule labSchedule=(lab_schedule)query2.uniqueResult();
			return labSchedule;
		}
	}

	@Override
	public List<lab_reservation> reservationByUser(int user_id) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("select new entity.lab_reservation(l.lab_id,l.building_name,l.room_number,l.person_number,l.is_free,l.description,"
				+"r.reserve_id,r.reserve_type,r.course_id,r.reserve_date,r.time_interval,"
				+"r.weekday,r.person_number,r.description,r.create_time) "
				+"from Reservation r,Laboratory l  where r.user_id="+user_id+" and r.lab_id=l.lab_id  order by create_time DESC");
		Query query = session.createQuery(hql.toString()); 
		List<lab_reservation> list=query.list();
		return list;
	}

	@Override
	public Reservation single_reservation_info(int reserve_id) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("from Reservation where reserve_id="+reserve_id);
		Query query = session.createQuery(hql.toString()); 
		Reservation Reservation=(entity.Reservation) query.uniqueResult();
		return Reservation;
	}

	@Override
	public int deleteReservation(int reserve_id) {
		Reservation reservation=single_reservation_info(reserve_id);
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("delete Reservation where reserve_id="+reserve_id);
		Query query = session.createQuery(hql.toString()); 
		int result=query.executeUpdate();
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar c = Calendar.getInstance();
	    String today=sf.format(c.getTime());
	    System.out.println("今天： "+sf.format(c.getTime()));
		
	    if(new Date().getTime()<reservation.getReserve_date().getTime()){
	    	if(reservation.getReserve_type()==1){
	    		StringBuffer sql2 =new StringBuffer("update Schedule set t"+reservation.getTime_interval()+"=t"+reservation.getTime_interval()+"-"+reservation.getPerson_number()+" where lab_id="+reservation.getLab_id()+" and schedule_date='"+reservation.getReserve_date()+"'");
	    		Query query2 = session.createQuery(sql2.toString()); 
	    		query2.executeUpdate();
	    	}else{
	    		StringBuffer sql3 =new StringBuffer("update Schedule set t"+reservation.getTime_interval()+"=0 where lab_id="+reservation.getLab_id()+" and schedule_date='"+reservation.getReserve_date()+"'");
	    		Query query3 = session.createQuery(sql3.toString()); 
	    		query3.executeUpdate();
	    	}
	    }
		return result;
	}

	@Override
	public List<lab_reservation> ReservationTeacherForStudent(int user_id) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("select new entity.lab_reservation(l.lab_id,l.building_name,l.room_number,l.person_number,"
			 +"r.reserve_id,r.reserve_type,r.course_id,r.courseName,r.reserve_date,r.time_interval,r.weekday,r.person_number,r.description,r.create_time)"
			 +" from Laboratory l, Reservation r"
			 +" where r.course_id in (select course_id from Course_user where user_id="+user_id+")" 
			 +"and r.lab_id=l.lab_id order by create_time DESC");
		Query query = session.createQuery(hql.toString()); 
		List<lab_reservation> list=query.list();
		return list;
	}

	@Override
	public List<user_lab_reservation> selectReservation(int user_id,
			int user_type, String user_name, int reserve_type, String from,
			String end) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("select new entity.user_lab_reservation(l.lab_id,l.building_name,l.room_number,"
			 +"r.reserve_id,r.reserve_type,r.course_id,r.courseName,r.reserve_date,r.time_interval,r.person_number,r.description,r.create_time,"
			 +"u.login_name,u.user_name,u.user_type)"
			 +" from User u, Laboratory l, Reservation r where 1=1 and r.user_id=u.user_id and l.lab_id=r.lab_id");
		if(user_name!=null)
			hql.append(" and u.user_name like'%"+user_name+"%'");
		if(user_id!=0)
			hql.append(" and u.user_id="+user_id);
		if(user_type!=0)
			hql.append(" and u.user_type="+user_type);
		if(reserve_type!=0) 
			hql.append(" and r.reserve_type='"+reserve_type+"'");
		if(from!=null) 
			hql.append(" and r.reserve_date>='"+from+"'");
		if(end!=null) 
			hql.append(" and r.reserve_date<='"+end+"'");			
		
		Query query = session.createQuery(hql.toString()); 
		List<user_lab_reservation> list=query.list();
		System.out.println("2:"+list.size());
		return list;
	}
	
}
