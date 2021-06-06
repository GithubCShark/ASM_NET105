using ASM_PS12496_NET105.Helpers;
using ASM_PS12496_NET105.Models;
using ASM_PS12496_NET105.Services;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ASM_PS12496_NET105.Controllers
{
    public class MonAnController : BaseController
    {
        private readonly IWebHostEnvironment _webHostEnviroment;
        private IMonAnSvc _monAnSvc;
        private IUploadHelper _uploadHelper;

        public MonAnController(IWebHostEnvironment webHostEnvironment, IMonAnSvc monAnSvc, IUploadHelper uploadHelper)
        {
            _webHostEnviroment = webHostEnvironment;
            _monAnSvc = monAnSvc;
            _uploadHelper = uploadHelper;
        }
        // GET: MonAnController
        public ActionResult Index()
        {
            return View(_monAnSvc.GetMonAnAll());
        }

        // GET: MonAnController/Details/5
        public ActionResult Details(int id)
        {
            var monAn = _monAnSvc.GetMonAn(id);
            return View(monAn);
        }

        // GET: MonAnController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MonAnController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MonAn monAn)
        {
            try
            {
                if (monAn.ImageFile != null)
                {
                    if (monAn.ImageFile.Length > 0)
                    {
                        string rootPath = Path.Combine(_webHostEnviroment.WebRootPath, "images");
                        _uploadHelper.UploadImage(monAn.ImageFile, rootPath, "MonAn");
                        monAn.Hinh = monAn.ImageFile.FileName;
                    }
                }
                _monAnSvc.AddMonAn(monAn);
                return RedirectToAction(nameof(Details), new { id = monAn.MonAnID });
            }
            catch
            {
                return View();
            }
        }

        // GET: MonAnController/Edit/5
        public ActionResult Edit(int id)
        {
            var monAn = _monAnSvc.GetMonAn(id);
            return View(monAn);
        }

        // POST: MonAnController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, MonAn monAn)
        {
            string thumuccon = "Monan";
            try
            {
                if (ModelState.IsValid)
                {
                    if (monAn.ImageFile != null)
                    {
                        if (monAn.ImageFile.Length > 0)
                        {
                            string rootPath = Path.Combine(_webHostEnviroment.WebRootPath, "images");
                            _uploadHelper.UploadImage(monAn.ImageFile, rootPath, thumuccon);
                            monAn.Hinh = monAn.ImageFile.FileName;
                        }
                    }
                }
                _monAnSvc.EditMonAn(id, monAn);
                return RedirectToAction(nameof(Details), new { id = monAn.MonAnID });
            }
            catch
            {
                
            }
            return RedirectToAction(nameof(Index));
        }

        // GET: MonAnController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: MonAnController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
