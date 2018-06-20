using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MeetingRoomReservApp.Models
{
    public class userdefMeetingRoom
    {
        public int RoomID { get; set; }

        public string RoomName { get; set; }

        public int LocationID { get; set; }

        public SelectList LocationList { get; set; }

        public string SelectLocation { get; set; }

        public DateTime? FromDate { get; set; }
        
        public DateTime? ToDate { get; set; }

        public int EmpID { get; set; }

        public string EmpName { get; set; }

        public int NoofAttendees { get; set; }
    }

}