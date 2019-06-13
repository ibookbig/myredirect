package myredirect.repos;

import myredirect.models.Link;
import myredirect.models.User;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LinkRepository extends CrudRepository<Link, Long>
{
    Link findByName(String name);

    List<Link> getAllByOwner(User user);
}
