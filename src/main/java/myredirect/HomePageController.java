package myredirect;
import myredirect.models.Link;
import myredirect.services.LinkService;
import myredirect.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomePageController
{
    @Autowired
    private LinkService linkService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home()
    {
        return "home";
    }

    @PostMapping("/shorten")
    public String shorten(@RequestParam("url") String url, final RedirectAttributes redirectAttributes, HttpServletRequest request)
    {
        String link_name = randomAlphaNumeric(5);
        Link new_link = new Link(link_name, url);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUsername = authentication.getName();
            new_link.setOwner(userService.findByUsername(currentUsername));
        }
        linkService.save(new_link);
        redirectAttributes.addFlashAttribute("message", "Link shortened: ");
        redirectAttributes.addFlashAttribute("new_url", request.getContextPath() + "/l/" + link_name);
        return "redirect:/";
    }

    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    public static String randomAlphaNumeric(int count) {
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(character));
        }
        return builder.toString();
    }
}
