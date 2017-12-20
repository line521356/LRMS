package service;

import java.util.List;

import entity.Laboratory;
import entity.Reservation;
import entity.lab_reservation;
import entity.lab_schedule;
import entity.user_lab_reservation;

public interface ReserveLaboratoryService {
	public int reserveLab(Reservation reservation);
	public List<lab_reservation> getLab_reservations(int lab_id);
	public List<lab_schedule> getSchedule_table(int lab_id);
	public List<lab_reservation> reservationByUser(int user_id);
	public int deleteReservation(int reserve_id);
	public List<lab_reservation> ReservationTeacherForStudent(int user_id);
	public List<user_lab_reservation> selectReservation(int user_id,
			int user_type, String user_name, int reserve_type, String from,
			String end);
}
