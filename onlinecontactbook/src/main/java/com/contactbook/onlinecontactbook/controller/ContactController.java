package com.contactbook.onlinecontactbook.controller;

import com.contactbook.onlinecontactbook.model.Contact;
import com.contactbook.onlinecontactbook.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Optional;

@Controller
public class ContactController {

    @Autowired
    private ContactRepository contactRepository;

    @GetMapping({"/", "/contacts"})
    public String getAllContacts(Model model) {
        model.addAttribute("contacts", contactRepository.findAll());
        return "contacts";
    }

    @GetMapping("/contacts/new")
    public String showAddContactForm(Model model) {
        model.addAttribute("contact", new Contact());
        model.addAttribute("pageTitle", "Add New Contact");
        return "contact-form";
    }

    @PostMapping("/contacts/save")
    public String saveContact(@ModelAttribute("contact") Contact contact) {
        contactRepository.save(contact);
        return "redirect:/contacts";
    }

    @GetMapping("/contacts/edit/{id}")
    public String showEditContactForm(@PathVariable Long id, Model model) {
        Optional<Contact> contact = contactRepository.findById(id);
        if (contact.isPresent()) {
            model.addAttribute("contact", contact.get());
            model.addAttribute("pageTitle", "Edit Contact");
            return "contact-form";
        } else {
            return "redirect:/contacts";
        }
    }

    @GetMapping("/contacts/delete/{id}")
    public String deleteContact(@PathVariable Long id) {
        contactRepository.deleteById(id);
        return "redirect:/contacts";
    }
}