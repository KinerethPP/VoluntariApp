package mx.edu.utez.voluntariapp_final.models.CRUD;

import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.organization.Organ;

import java.sql.SQLException;
import java.util.List;

public interface DaoRepository<T> {
    List<T> findAll();

    T findOne(Long id);

    boolean save(T object) throws SQLException;

    boolean save(Organ organ, String email, String password, String enable, String role);

    boolean update(T object);

    boolean update(Organ organ, String email, String password);

    boolean delete(Long id);

    List<Role> searchRole();

}
