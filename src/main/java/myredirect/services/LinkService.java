package myredirect.services;

import myredirect.models.Link;
import myredirect.models.User;

import java.util.List;

public interface LinkService
{
    void save(Link link);

    Link findByName(String name);

    List<Link> getAllByOwner(User user);
}
