package com.example.Nguyenvinhson;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;



@RestController
@RequestMapping("/")
public class HelloController {
    
    @GetMapping("hello")
    public String index() {
        return "Hello Spring Boot Application";
    }

    @PostMapping("/testposst")
    public String postMethodName(@RequestBody String entity) {
        
        
        return entity;
    }
    

    @PutMapping("testPut/{id}")
    public String update(@PathVariable String id, @RequestBody String entity) {
        
        
        return entity;
    }

    @DeleteMapping("testDele/{id}")
    public String delete(@PathVariable String id) {
        return "Deleted entity with ID: " + id;
    }
    
}
