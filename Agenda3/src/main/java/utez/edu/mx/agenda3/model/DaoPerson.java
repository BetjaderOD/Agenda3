package utez.edu.mx.agenda3.model;

import utez.edu.mx.agenda3.utils.MySQLConnection;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;



public class DaoPerson {
    public List<BeanPerson> list() {
        List<BeanPerson> list = new ArrayList<>();
        try {
            Connection connection = MySQLConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM person");
            while (resultSet.next()) {
                list.add(new BeanPerson(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("lastName"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address")
                ));
            }
            connection.close();
            statement.close();
            resultSet.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean save(BeanPerson beanPerson) {
        boolean result = false;
        try (
                Connection connection = MySQLConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO person (name, lastName, email, phone, address) VALUES (?,?,?,?,?)");
        ) {
            preparedStatement.setString(1, beanPerson.getName());
            preparedStatement.setString(2, beanPerson.getLastName());
            preparedStatement.setString(3, beanPerson.getEmail());
            preparedStatement.setString(4, beanPerson.getPhone());
            preparedStatement.setString(5, beanPerson.getAddress());
            result = preparedStatement.executeUpdate() == 1;


        } catch (Exception e) {
            e.printStackTrace();

        }
        return result;
    }

    public BeanPerson get(int id) {
        BeanPerson person = new BeanPerson();
        try (
                Connection connection = MySQLConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM person WHERE id = ?");
        ) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                person.setId(resultSet.getInt("id"));
                person.setName(resultSet.getString("name"));
                person.setLastName(resultSet.getString("lastname"));
                person.setEmail(resultSet.getString("email"));
                person.setPhone(resultSet.getString("phone"));
                person.setAddress(resultSet.getString("address"));

            }
            connection.close();
            preparedStatement.close();
            resultSet.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return person;
    }

    public boolean update(BeanPerson person) {
        boolean result = false;
        try (
                Connection connection = MySQLConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("UPDATE person SET name = ?, lastName = ?, email = ?, phone = ?, address = ? WHERE id = ?");
        ) {
            preparedStatement.setString(1, person.getName());
            preparedStatement.setString(2, person.getLastName());
            preparedStatement.setString(3, person.getEmail());
            preparedStatement.setString(4, person.getPhone());
            preparedStatement.setString(5, person.getAddress());
            preparedStatement.setInt(6, person.getId());
            result = preparedStatement.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean delete(int id) {
        boolean result = false;
        try (
                Connection connection = MySQLConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM person WHERE id = ?");
        ) {
            preparedStatement.setInt(1, id);
            result = preparedStatement.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

/*
    public List<BeanPerson> orderByName() {
        List<BeanPerson> list = new ArrayList<>();
        try {
            Connection connection = MySQLConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM person ORDER BY name");
            while (resultSet.next()) {
                list.add(new BeanPerson(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("lastName"),
                        resultSet.getString("email"),
                        resultSet.getInt("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("curp"),
                        resultSet.getInt("nss")
                ));
            }
            connection.close();
            statement.close();
            resultSet.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    */


    public List<BeanPerson> orderByName() {
        List<BeanPerson> list = new ArrayList<>();
        try {
            Connection connection = MySQLConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM person");
            while (resultSet.next()) {
                list.add(new BeanPerson(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("lastName"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address")
                ));
            }
            connection.close();
            statement.close();
            resultSet.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return quickSort(list, 0, list.size() - 1);
    }

    private List<BeanPerson> quickSort(List<BeanPerson> list, int i, int i1) {
        if (i < i1) {
            int p = partition(list, i, i1);
            quickSort(list, i, p - 1);
            quickSort(list, p + 1, i1);
        }
        return list;
    }

    private int partition(List<BeanPerson> list, int i, int i1) {
        BeanPerson pivot = list.get(i1);
        int j = i - 1;
        for (int k = i; k < i1; k++) {
            if (list.get(k).getName().compareTo(pivot.getName()) < 0) {
                j++;
                BeanPerson temp = list.get(j);
                list.set(j, list.get(k));
                list.set(k, temp);
            }
        }
        BeanPerson temp = list.get(j + 1);
        list.set(j + 1, list.get(i1));
        list.set(i1, temp);
        return j + 1;
    }

    private List<BeanPerson> bubbleSort(List<BeanPerson> list) {
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = 0; j < list.size() - 1; j++) {
                if (list.get(j).getId() < list.get(j + 1).getId()) {
                    BeanPerson temp = list.get(j);
                    list.set(j, list.get(j + 1));
                    list.set(j + 1, temp);
                }
            }
        }
        return list;
    }
    public List<BeanPerson> orderByidDesc() {
        List<BeanPerson> list = new LinkedList<>();
        try {
            Connection connection = MySQLConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM person");
            while (resultSet.next()) {
                list.add(new BeanPerson(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("lastName"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address")

                ));
            }
            connection.close();
            statement.close();
            resultSet.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bubbleSort(list);
    }

    public List<BeanPerson> searchByName(String name) {
        List<BeanPerson> list = new ArrayList<>();
        try (
                Connection connection = MySQLConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM person WHERE name LIKE ?");
        ) {
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new BeanPerson(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("lastName"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address")

                ));
            }
            connection.close();
            preparedStatement.close();
            resultSet.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


/*
    public List<BeanPerson> download() {
        try (
                Connection connection = MySQLConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM person WHERE id = ?");
        ) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Blob blob = resultSet.getBlob("file");
                InputStream inputStream = blob.getBinaryStream();
                OutputStream outputStream = new FileOutputStream(new File("|C:\\Users\\betja\\Desktop\\file.txt"));
                int bytesRead = -1;
                byte[] buffer = new byte[4096];
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outputStream.close();
                System.out.println("File downloaded");
            }
            connection.close();
            preparedStatement.close();
            resultSet.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
 */
}
