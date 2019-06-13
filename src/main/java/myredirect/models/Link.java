package myredirect.models;

import javax.persistence.*;

import myredirect.models.User;

import java.util.Set;

@Entity
@Table(name = "links")
public class Link
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String url;

    private Integer count;

    @ManyToOne
    private User owner;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public User getOwner()
    {
        return owner;
    }

    public void setOwner(User owner)
    {
        this.owner = owner;
    }

    public Integer getCount()
    {
        return count;
    }

    public void setCount(Integer count)
    {
        this.count = count;
    }

    public Link() {}

    public Link(String name, String url)
    {
        this.name = name;
        this.url = url;
        this.count = 0;
    }
}
