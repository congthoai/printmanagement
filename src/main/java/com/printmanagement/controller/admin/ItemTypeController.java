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

import com.printmanagement.dto.ItemTypeDTO;
import com.printmanagement.service.IItemTypeService;
import com.printmanagement.util.MessageUtil;

@Controller(value="itemtypeControllerOfAdmin")
public class ItemTypeController {
    @Autowired
    private IItemTypeService itemtypeService;
    
    @RequestMapping(value= "/quan-tri/loai-san-pham/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
            @RequestParam(value="limit", required = false) Integer limit, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/itemtype/list");
        ItemTypeDTO model = new ItemTypeDTO();
        model.setPage(page != null ? page : 1);
        model.setLimit(limit != null ? limit : 10);
        Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit());
        model.setListResult(itemtypeService.findAll(pageable));
        model.setTotalItem(itemtypeService.getTotalItem());
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        if(request.getParameter("message") != null) {
            Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }

        mav.addObject("model", model);
        return mav;
    }
    
    @RequestMapping(value = "/quan-tri/loai-san-pham/chinh-sua", method = RequestMethod.GET)
    public ModelAndView editItemType(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("admin/itemtype/edit");
        ItemTypeDTO model = new ItemTypeDTO();
        
        if(id != null) {
            model = itemtypeService.findOne(id);
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
