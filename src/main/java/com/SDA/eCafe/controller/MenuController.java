package com.SDA.eCafe.controller;

import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.SDA.eCafe.model.Menu;
import com.SDA.eCafe.model.User;
import com.SDA.eCafe.repository.MenuRepository;
import com.SDA.eCafe.repository.UserRepository;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;

@Controller
public class MenuController {
    MenuRepository menuRepository;
    UserRepository userRepository;

    @Autowired
    public MenuController(MenuRepository menuRepository, UserRepository userRepository) {
        this.menuRepository = menuRepository;
        this.userRepository = userRepository;
    }

    public String getRoleFromCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        Integer userId = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")) {
                    userId = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
            Optional<User> loggedInUser = userRepository.findById(userId);
            if (!loggedInUser.isEmpty()) {
                System.out.println(loggedInUser.get().getRole());
                return loggedInUser.get().getRole();
            }
        }
        return "noUser";
    }

    @GetMapping("/openMenu")
    public String openMenu(Model model, HttpServletRequest request) {
        if ("Manager".equals(getRoleFromCookies(request)) || "Admin".equals(getRoleFromCookies(request))) {
            List<Menu> menu = menuRepository.findAll();
            
            if (menu.isEmpty()) {
                model.addAttribute("error", "No menu records found.");
                return "Menu"; // Or redirect to an error page
            }

            // Fetch and add menu details if available
            String startTime = menu.get(0).getStartTime().toString();
            String endTime = menu.get(0).getEndTime().toString();
            String breakFastTime = menu.get(0).getBreakFastTime().toString();

            model.addAttribute("startTime", startTime);
            model.addAttribute("endTime", endTime);
            model.addAttribute("breakFastTime", breakFastTime);

            String role = getRoleFromCookies(request);
            model.addAttribute("role", role);
            
            return "Menu";
        } else {
            return "redirect:/login";
        }
    }

    // @GetMapping("/RetrieveTiming")
    // public String RetrieveTiming(Model model) {

    //     try {
    //         model.addAttribute("menu", menuRepository.findAll());
    //         return "Alltimings";
    //     } catch (Exception e) {
    //         return "error";
    //     }
    // }


    // @GetMapping("/EditTime/{id}")
    // public String EditTime(@PathVariable Long id, Model model) {
    //     try {
    //         Optional<Menu> menues = menuRepository.findById(id);
    //         model.addAttribute("menu", menues.get());
    //         return "EditMenu";
    //     } catch (Exception e) {
    //         return "error";
    //     }
    // }

    // @GetMapping("/Delete/{id}")
    // public String Delete(@PathVariable Long id, Model model) {
    //     try{
    //         menuRepository.deleteById(id);
    //         return "redirect:/RetrieveTiming";
    //     } catch (Exception e) {
    //         return "error";
    //     }
    // }



    @PostMapping("/saveMenuTiming")
    @Transactional
    public String saveMenu(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime startTime,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime endTime,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime breakFastTime,
            Model model, HttpServletRequest request) {
        try {
            // Check user role
            String role = getRoleFromCookies(request);
            if (!"Manager".equals(role) && !"Admin".equals(role)) {
                return "redirect:/login";
            }

            // Retrieve menu record
            List<Menu> menuList = menuRepository.findAll();
            Menu menu;

            if (menuList.isEmpty()) {
                // Create a new Menu record if none exists
                menu = new Menu();
            } else {
                // Update the existing record
                menu = menuList.get(0);
            }

            // Set menu timings
            menu.setStartTime(startTime);
            menu.setEndTime(endTime);
            menu.setBreakFastTime(breakFastTime);

            // Save the menu
            menuRepository.save(menu);

            // Add role to the model for the view
            model.addAttribute("role", role);

            return "redirect:/openMenu";
        } catch (IndexOutOfBoundsException e) {
            // Specific handling for no menu records
            model.addAttribute("error", "No menu records found. Please add a menu first.");
            return "Menu"; // Return an error page or redirect appropriately
        } catch (Exception e) {
            // Generic exception handling
            model.addAttribute("error", "An unexpected error occurred: " + e.getMessage());
            return "error"; // Return a generic error page
        }
    }

}
