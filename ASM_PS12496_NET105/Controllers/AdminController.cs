using ASM_PS12496_NET105.Constant;
using ASM_PS12496_NET105.Models;
using ASM_PS12496_NET105.Models.ViewModels;
using ASM_PS12496_NET105.Services;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASM_PS12496_NET105.Controllers
{
    public class AdminController : Controller
    {
        private readonly IWebHostEnvironment _webHostEnviroment;
        private INguoidungSvc _nguoidungSvc;

        public AdminController(IWebHostEnvironment webHostEnvironment, INguoidungSvc nguoidungSvc)
        {
            _webHostEnviroment = webHostEnvironment;
            _nguoidungSvc = nguoidungSvc;
        }

        public IActionResult Login(string returnUrl)
        {
            string userName = HttpContext.Session.GetString(SessionKey.Nguoidung.UserName);
            if (userName != null && userName != "")
            {
                return RedirectToAction("Index", "Home");
            }

            ViewLogin login = new ViewLogin();
            login.ReturnUrl = returnUrl;
            return View(login);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(ViewLogin viewLogin)
        {
            if (ModelState.IsValid)
            {
                Nguoidung nguoidung = _nguoidungSvc.Login(viewLogin);
                if (nguoidung != null)
                {
                    HttpContext.Session.SetString(SessionKey.Nguoidung.UserName, nguoidung.UserName);
                    HttpContext.Session.SetString(SessionKey.Nguoidung.FullName, nguoidung.FullName);
                    HttpContext.Session.SetString(SessionKey.Nguoidung.NguoidungContext, JsonConvert.SerializeObject(nguoidung));
                    return RedirectToAction(nameof(HomeController.Index), "Home");
                }
            }
            return View(viewLogin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction(nameof(HomeController.Index), "Home");
        }
    }
}
