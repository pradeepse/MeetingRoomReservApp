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
    
    public partial class Employee
    {
        public Employee()
        {
            this.MeetRoomReserveds = new HashSet<MeetRoomReserved>();
        }
    
        public int EmpID { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
    
        public virtual ICollection<MeetRoomReserved> MeetRoomReserveds { get; set; }
    }
}