//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MeetingRoomReservApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class MeetingRoom
    {
        public MeetingRoom()
        {
            this.MeetRoomReserveds = new HashSet<MeetRoomReserved>();
        }
    
        public int RoomID { get; set; }
        public string RoomName { get; set; }
        public Nullable<int> LocationID { get; set; }
        public Nullable<int> NoofAttendees { get; set; }
    
        public virtual Location Location { get; set; }
        public virtual ICollection<MeetRoomReserved> MeetRoomReserveds { get; set; }
    }
}
