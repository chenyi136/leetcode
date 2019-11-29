package com.my.blog.myblog.controller;

import com.github.pagehelper.PageInfo;
import com.my.blog.myblog.constant.WebConst;
import com.my.blog.myblog.modal.vo.ContentVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


//@GetMapping 组合注解，是@RequestMapping(method = RequestMethod.GET)的缩写
public class indexController extends BaseController {
//    private static final com.my.blog.myblog.constant.WebConst WebConst = ;

    @GetMapping(value = {"/", "index"})
    public String index(HttpServletRequest request, @RequestParam(value = "limit", defaultValue = "12") int limit) {
        return this.render("index");
    }



    /**
     * 首页分页
     *
     * @param request request
     * @param p       第几页
     * @param limit   每页大小
     * @return 主页
     */
//    @GetMapping(value = "page/{p}")
//    public String index(HttpServletRequest request, @PathVariable int p, @RequestParam(value = "limit", defaultValue = "12") int limit) {
////        p = p < 0 || p > WebConst.MAX_PAGE ? 1 : p;
////        PageInfo<ContentVo> articles = contentService.getContents(p, limit);
////        request.setAttribute("articles", articles);
////        if (p > 1) {
////            this.title(request, "第" + p + "页");
////        }
//        return this.render("index");
//    }
}