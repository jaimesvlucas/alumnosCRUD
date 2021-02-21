/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author User
 */
public class Utilidades {
    public static ArrayList<Alumnos> getAlumnos(String grupo){
        ArrayList<Alumnos> alumnos = new ArrayList<>();
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_alumnosCRUD_war_1.0-SNAPSHOTPU");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT * FROM alumnos WHERE grupo = '"+grupo+"'";
        Query q = manager.createNativeQuery(sql, Alumnos.class);
        List<Alumnos> alumnosBD = q.getResultList();
        for (Alumnos a : alumnosBD){
            Alumnos alumno = new Alumnos(a.getId(),a.getGrupo(), a.getNombre(), a.getApellidos(), a.getCorreo());
            alumnos.add(alumno);
        }
        return alumnos;
    }
}
