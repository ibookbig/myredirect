package myredirect.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import myredirect.models.User;

public interface UserRepository extends JpaRepository<User, Long>
{
    User findByUsername(String username);
}
