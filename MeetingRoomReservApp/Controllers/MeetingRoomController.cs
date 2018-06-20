using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GridMvc.Html;
using MeetingRoomReservApp.Models;

namespace MeetingRoomReservApp.Controllers
{
    public class MeetingRoomController : Controller
    {
        //
        // GET: /MeetingRoom/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MeetingRoom()
        {
            userdefMeetingRoom objModel = new userdefMeetingRoom();
            
            //var result = entities.usp_GetMeetingRoomReserv(1, 1).ToList();
            return View(objModel);
        }
        
        [HttpPost]
        public ActionResult MeetingPost(userdefMeetingRoom obj)
        {
            MeetingRoomResvDBEntities entities = new MeetingRoomResvDBEntities();
            IEnumerable<usp_GetMeetingRoomReserv_Result1> result = entities.usp_GetMeetingRoomReserv(obj.EmpID).ToList();
            return PartialView("~/Views/MeetingRoom/MeetingRoomGrid.cshtml", result);
        }

        public ActionResult MeetingRoomFinder()
        {
            userdefMeetingRoom objModel = new userdefMeetingRoom();
            MeetingRoomResvDBEntities entities = new MeetingRoomResvDBEntities();
            IEnumerable<Location> loclst = (from location in entities.Locations.Take(10)
                                            select location);
            //objModel.EmpID = 1;
            objModel.LocationList = new SelectList(loclst, "LocationID", "LocationName");
            return View(objModel);
        }

        [HttpPost]
        public ActionResult MeetingRoomFinderPost(userdefMeetingRoom obj)
        {
            MeetingRoomResvDBEntities entities = new MeetingRoomResvDBEntities();
            IEnumerable<usp_MeetingRoomFinder_Result> result = entities.usp_MeetingRoomFinder(obj.EmpID, Convert.ToInt32(obj.SelectLocation), "", obj.FromDate, obj.ToDate, obj.NoofAttendees).ToList();
            return PartialView("~/Views/MeetingRoom/MeetingRoomFinderGrid.cshtml", result);
        }
    }
}
