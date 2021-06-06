using ASM_PS12496_NET105.Constant;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASM_PS12496_NET105.Filters
{
    public class AuthenticationFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            Controller controller = filterContext.Controller as Controller;
            var session = filterContext.HttpContext.Session;
            string userName = filterContext.HttpContext.Session.GetString(SessionKey.Nguoidung.UserName);
            var sessionStatus = ((userName != null && userName != "") ? true : false);
            if (controller != null)
            {
                if (session == null || !sessionStatus)
                {
                    filterContext.Result =
                        new RedirectToRouteResult(
                            new RouteValueDictionary
                            {
                                { "controller", "Admin" },
                                { "action", "Login" }
                            });
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}
