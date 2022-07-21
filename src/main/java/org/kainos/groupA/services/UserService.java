package org.kainos.groupA.services;

import org.jose4j.lang.JoseException;
import org.kainos.groupA.dao.UserDao;
import org.kainos.groupA.exception.InvalidUserException;
import org.kainos.groupA.models.LoginUser;
import org.kainos.groupA.models.User;
import org.kainos.groupA.utils.DatabaseConnector;

import java.sql.SQLException;
import java.util.Map;

public class UserService {

    private DatabaseConnector databaseConnector;
    private UserDao userDao;

    public UserService(DatabaseConnector databaseConnector, UserDao userDao) {
        this.databaseConnector = databaseConnector;
        this.userDao = userDao;
    }

    public int createUser(User user) throws SQLException {
        return userDao.createUser(user, databaseConnector.getConnection());
    }

    public String loginUser(LoginUser loginUser) throws SQLException, JoseException, InvalidUserException {
        return userDao.loginUser(loginUser, databaseConnector.getConnection());
    }
}
