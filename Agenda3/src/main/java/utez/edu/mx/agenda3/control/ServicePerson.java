package utez.edu.mx.agenda3.control;

import utez.edu.mx.agenda3.model.BeanPerson;
import utez.edu.mx.agenda3.model.DaoPerson;

import java.util.List;

public class ServicePerson {
    public List<BeanPerson> list() {
        DaoPerson daoPerson = new DaoPerson();
        List <BeanPerson> listperson = daoPerson.list();
        return listperson;

    };
    public boolean save(BeanPerson beanPerson){
        DaoPerson daoPerson = new DaoPerson();
        return daoPerson.save(beanPerson);
    };
    public static BeanPerson getPerson(int id){
        DaoPerson daoPerson = new DaoPerson();
        return daoPerson.get(id);
    }
    public static boolean update(BeanPerson beanPerson){
        DaoPerson daoPerson = new DaoPerson();
        return daoPerson.update(beanPerson);
    };
    public static boolean delete(int id){
        DaoPerson daoPerson = new DaoPerson();
        return daoPerson.delete(id);
    };
    public List<BeanPerson> orderByName(String order){
        DaoPerson daoPerson = new DaoPerson();
        List <BeanPerson> listperson = daoPerson.orderByName();
        return listperson;
    };
    public List<BeanPerson> orderByidDesc(String order){
        DaoPerson daoPerson = new DaoPerson();
        List <BeanPerson> listperson = daoPerson.orderByidDesc();
        return listperson;
    };
    public List<BeanPerson> searchByName(String name){
        DaoPerson daoPerson = new DaoPerson();
        List <BeanPerson> listperson = daoPerson.searchByName(name);
        return listperson;
    };

    /*
    public List<BeanPerson> download(){
        DaoPerson daoPerson = new DaoPerson();
        List <BeanPerson> listperson = daoPerson.download();
        return listperson;
    };

     */

}
