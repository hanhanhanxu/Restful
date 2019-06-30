package hx.insist.controller;


import hx.insist.dao.DepartmentDao;
import hx.insist.dao.EmployeeDao;
import hx.insist.entitys.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class EmployeeHandler {

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DepartmentDao departmentDao;

    //查 所有
    @RequestMapping(value = "/emps", method= RequestMethod.GET)
    public String list(Map<String, Object> map){
        map.put("employees", employeeDao.getAll());
        //map.put("employees", null);
        return "list";
    }

    //删除 某个
    @RequestMapping(value="/emp/{id}", method=RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id){
        employeeDao.delete(id);
        return "redirect:/emps";
    }

    //跳转到增页面
    @RequestMapping(value="/emp", method=RequestMethod.GET)
    public String input(Map<String, Object> map){
        map.put("departments", departmentDao.getDepartments());
        map.put("employee", new Employee());
        return "input";
    }

    //增
    @RequestMapping(value="/emp", method=RequestMethod.POST)
    public String save(Employee employee){
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    //跳转到改页面
    @RequestMapping(value="/emp/{id}", method=RequestMethod.GET)
    public String input(@PathVariable("id") Integer id ,Map<String, Object> map){
        map.put("departments", departmentDao.getDepartments());
        map.put("employee", employeeDao.get(id));
        return "input";
    }

    //改
    @RequestMapping(value="/emp", method=RequestMethod.PUT)
    public String update(Employee employee){
        employeeDao.save(employee);
        return "redirect:/emps";
    }
}