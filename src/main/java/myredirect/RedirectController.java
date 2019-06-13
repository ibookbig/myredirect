package myredirect;

import myredirect.models.Link;
import myredirect.repos.LinkRepository;
import myredirect.services.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "Link not found")
class LinkNotFoundException extends RuntimeException {
}

@Controller
public class RedirectController
{
    @Autowired
    private LinkService linkService;

    @Autowired
    private LinkRepository linkRepository;

    @RequestMapping(value = "/l/{name}", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getLink(@PathVariable("name") String name)
    {
        Link found_link = linkService.findByName(name);
        if (found_link == null)
        {
            throw new LinkNotFoundException();
        }
        else
        {
            found_link.setCount(found_link.getCount() + 1);
            linkRepository.save(found_link);

            RedirectView rv = new RedirectView();
            rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
            rv.setUrl(found_link.getUrl());
            ModelAndView mv = new ModelAndView(rv);
            return mv;
        }
    }
}
