package myredirect.services;

import myredirect.models.Link;
import myredirect.repos.LinkRepository;
import myredirect.models.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LinkServiceImpl implements LinkService
{
    @Autowired
    private LinkRepository linkRepository;

    @Override
    public void save(Link link) {
        linkRepository.save(link);
    }

    @Override
    public Link findByName(String name) {
        return linkRepository.findByName(name);
    }

    @Override
    public List<Link> getAllByOwner(User user) { return linkRepository.getAllByOwner(user); }
}
