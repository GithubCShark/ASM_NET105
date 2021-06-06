using ASM_PS12496_NET105.Constant;
using ASM_PS12496_NET105.Filters;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASM_PS12496_NET105.Controllers
{
    [AuthenticationFilter]
    public class BaseController : Controller
    {
        public BaseController() { }

        protected string GetUserName()
        {
            return HttpContext.Session.GetString(SessionKey.Nguoidung.UserName);
        }

        protected string GetFullName()
        {
            return HttpContext.Session.GetString(SessionKey.Nguoidung.FullName);
        }

        protected string GetKHEmail()
        {
            return HttpContext.Session.GetString(SessionKey.Khachhang.KH_Email);
        }
    }
}
