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
    
    public partial class Location
    {
        public Location()
        {
            this.MeetingRooms = new HashSet<MeetingRoom>();
            this.MeetRoomReserveds = new HashSet<MeetRoomReserved>();
        }
    
        public int LocationID { get; set; }
        public string LocationName { get; set; }
    
        public virtual ICollection<MeetingRoom> MeetingRooms { get; set; }
        public virtual ICollection<MeetRoomReserved> MeetRoomReserveds { get; set; }
    }
}
