using ASM_PS12496_NET105.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASM_PS12496_NET105.Services
{
    public interface IDonhangChitietSvc
    {
        int AddDonhangChitietSvc(DonhangChitiet donhangChitiet);
    }

    public class DonhangChitietSvc : IDonhangChitietSvc
    {
        protected DataContext _context;

        public DonhangChitietSvc(DataContext context)
        {
            _context = context;
        }

        public int AddDonhangChitietSvc(DonhangChitiet donhangchitiet)
        {
            int ret = 0;
            try
            {
                _context.Add(donhangchitiet);
                _context.SaveChanges();
                ret = donhangchitiet.ChitietID;
            }
            catch (Exception)
            {
                ret = 0;
            }
            return ret;
        }
    }
}
