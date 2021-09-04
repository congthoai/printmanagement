package com.printmanagement.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.printmanagement.dto.MaterialTypeDTO;
import com.printmanagement.service.IMaterialTypeService;
import com.printmanagement.util.MessageUtil;

@Controller(value="materialtypeControllerOfAdmin")
public class MaterialTypeController {
    @Autowired
    private IMaterialTypeService materialtypeService;
    
    @RequestMapping(value= "/quan-tri/loai-vat-tu/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
            @RequestParam(value="limit", required = false) Integer limit, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/materialtype/list");
        MaterialTypeDTO model = new MaterialTypeDTO();
        model.setPage(page != null ? page : 1);
        model.setLimit(limit != null ? limit : 10);
        Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit());
        model.setListResult(materialtypeService.findAll(pageable));
        model.setTotalItem(materialtypeService.getTotalItem());
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        if(request.getParameter("message") != null) {
            Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }

        mav.addObject("model", model);
        return mav;
    }
    
    @RequestMapping(value = "/quan-tri/loai-vat-tu/chinh-sua", method = RequestMethod.GET)
    public ModelAndView editMaterialType(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("admin/materialtype/edit");
        MaterialTypeDTO model = new MaterialTypeDTO();
        
        if(id != null) {
            model = materialtypeService.findOne(id);
        }
        
        if(request.getParameter("message") != null) {
            Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }

        mav.addObject("model", model);
        return mav;
    }
}
