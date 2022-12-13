package utez.edu.mx.agenda3.control;

import utez.edu.mx.agenda3.model.BeanPerson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletPerson", urlPatterns = {
        "/list-person",
        "/save-person",
        "/create-person",
        "/get-person",
        "/update-person",
        "/delete-person",
        "/order-person",
        "/order-person-desc",
        "/search-person",
        "/download-file"


})
public class ServletPerson extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        ServicePerson servicePerson;
        switch (option) {
            case "/list-person":
                servicePerson = new ServicePerson();
                List<BeanPerson> list = servicePerson.list();
                request.setAttribute("list", list);
                request.getRequestDispatcher("/WEB-INF/view/list-person.jsp").forward(request, response);
                break;
            case "/create-person":
                request.getRequestDispatcher("/WEB-INF/view/create-person.jsp").forward(request, response);
                break;
            case "/get-person":
                String id = request.getParameter("id") != null ? request.getParameter("id") : "0";
                try {
                    int idPerson = Integer.parseInt(id);
                    servicePerson = new ServicePerson();
                    BeanPerson beanPerson = servicePerson.getPerson(idPerson);
                    request.setAttribute("personX", beanPerson);
                    request.getRequestDispatcher("/WEB-INF/view/get-person.jsp").forward(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }

                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        switch (option) {
            case "/save-person":
                try {
                    String name = request.getParameter("name") != null ? request.getParameter("name") : "0";
                    String lastName = request.getParameter("lastname") != null ? request.getParameter("lastname") : "0";
                    String email = request.getParameter("email") != null ? request.getParameter("email") : "0";
                 String phone = request.getParameter("phone") != null ? request.getParameter("phone") : "0";
                    String address = request.getParameter("address") != null ? request.getParameter("address") : "0";


                    ServicePerson servicePerson = new ServicePerson();

                    BeanPerson person = new BeanPerson();
                    person.setName(name);
                    person.setLastName(lastName);
                    person.setEmail(email);
                    person.setPhone(phone);
                    person.setAddress(address);


                    boolean result = servicePerson.save(person);
                    response.sendRedirect("list-person?result=" + (result ? "success" : "error"));

                } catch (Exception e) {
                    response.sendRedirect("list-person?result-save=error");

                }
                break;
            case "/update-person":
                String idString = request.getParameter("id") != null ? request.getParameter("id") : "0";
                String name = request.getParameter("name") != null ? request.getParameter("name") : "0";
                String lastName = request.getParameter("lastname") != null ? request.getParameter("lastname") : "0";
                String email = request.getParameter("email") != null ? request.getParameter("email") : "0";
              String phone = request.getParameter("phone") != null ? request.getParameter("phone") : "0";
                String address = request.getParameter("address") != null ? request.getParameter("address") : "0";


                try {
                    int id = Integer.parseInt(idString);
                    ServicePerson servicePerson = new ServicePerson();
                    BeanPerson person = new BeanPerson();
                    person.setId(id);
                    person.setName(name);
                    person.setLastName(lastName);
                    person.setEmail(email);
                    person.setPhone(phone);
                    person.setAddress(address);
                    boolean result = servicePerson.update(person);
                    response.sendRedirect("list-person?result="+(result? "success" : "error"));
                }catch (Exception e){
                    response.sendRedirect("list-person?result-update=error");
                }
                break;
            case "/delete-person":
                String id = request.getParameter("id") != null ? request.getParameter("id") : "0";
                try {
                    int idPerson = Integer.parseInt(id);
                    ServicePerson servicePerson = new ServicePerson();
                    boolean result = servicePerson.delete(idPerson);
                    response.sendRedirect("list-person?result="+(result? "success" : "error"));
                }catch (Exception e){
                    response.sendRedirect("list-person?result-delete=error");
                }
                break;
                case "/order-person":
                    String order = request.getParameter("order") != null ? request.getParameter("order") : "0";
                    try {
                        ServicePerson servicePerson = new ServicePerson();
                        List<BeanPerson> list = servicePerson.orderByName(order);
                        request.setAttribute("list", list);
                        request.getRequestDispatcher("/WEB-INF/view/list-person.jsp").forward(request, response);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                    break;
                case "/order-person-desc":
                    String orderDesc = request.getParameter("order") != null ? request.getParameter("order") : "0";
                    try {
                        ServicePerson servicePerson = new ServicePerson();
                        List<BeanPerson> list = servicePerson.orderByidDesc(orderDesc);
                        request.setAttribute("list", list);
                        request.getRequestDispatcher("/WEB-INF/view/list-person.jsp").forward(request, response);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                    break;
                    case "/search-person":
                        String search = request.getParameter("search") != null ? request.getParameter("search") : "0";
                        try {
                            ServicePerson servicePerson = new ServicePerson();
                            List<BeanPerson> list = servicePerson.searchByName(search);
                            request.setAttribute("list", list);
                            request.getRequestDispatcher("/WEB-INF/view/list-person.jsp").forward(request, response);
                        }catch (Exception e){
                            e.printStackTrace();
                        }

                        break;

            default:
                response.sendRedirect("list-person");
                break;

        }
    }
}
