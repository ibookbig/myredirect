package myredirect.services;

import myredirect.models.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}