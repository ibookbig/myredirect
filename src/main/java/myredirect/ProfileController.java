package myredirect;

import myredirect.models.Link;
import myredirect.services.LinkService;
import myredirect.services.UserService;
import myredirect.models.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ProfileController
{
    @Autowired
    private UserService userService;

    @Autowired
    private LinkService linkService;

    @GetMapping("/profile")
    public String getProfile(HttpServletRequest request)
    {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUsername = authentication.getName();
            User this_user = userService.findByUsername(currentUsername);
            List<Link> links = linkService.getAllByOwner(this_user);
            request.setAttribute("links", links);
            return "profile";
        }
        else
        {
            return "redirect:/login";
        }

    }
}
