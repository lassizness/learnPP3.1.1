package lazzy.web.controller;

import lazzy.web.model.User;
import lazzy.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @PostMapping("/add")
    public User addUser(@RequestBody User user) {
        return userService.addUser(user);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable("id") long id) {
        userService.deleteUser(id);
    }

    @GetMapping("/edit/{id}")
    public User getUser(@PathVariable("id") long id) {
        return userService.getUser(id);
    }

    @PutMapping("/{id}")
    public User editUser(@PathVariable("id") long id, @RequestBody User user) {
        user.setId(id);
        return userService.updateUser(user);
    }
}
