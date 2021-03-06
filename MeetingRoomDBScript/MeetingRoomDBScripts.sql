USE [MeetingRoomResvDB]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 06/20/2018 19:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] NOT NULL,
	[LocationName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/20/2018 19:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MeetingRoom]    Script Date: 06/20/2018 19:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MeetingRoom](
	[RoomID] [int] NOT NULL,
	[RoomName] [varchar](40) NULL,
	[LocationID] [int] NULL,
	[NoofAttendees] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MeetRoomReserved]    Script Date: 06/20/2018 19:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeetRoomReserved](
	[ResvID] [int] NOT NULL,
	[RoomID] [int] NULL,
	[LocationID] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[EmpID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResvID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_MeetingRoomFinder]    Script Date: 06/20/2018 19:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pradep
-- Create date: 19/06/2018
-- Description:	Retreive Meeting Room details
-- =============================================
CREATE PROCEDURE [dbo].[usp_MeetingRoomFinder]
	-- Add the parameters for the stored procedure here
	@EmpID int,
	@LocationID int,
	@RoomName varchar(50),
	@FromDate datetime,
	@ToDate datetime,
	@NoAttendees int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Mr.ResvID,Mr.RoomID,Mr.LocationID,FromDate,ToDate,EmpID,'Booked' as Status from dbo.MeetRoomReserved Mr 
	inner join MeetingRoom M on M.RoomID = Mr.RoomID
	where Mr.LocationID = @LocationID 
	and Mr.FromDate = @FromDate and Mr.ToDate = @ToDate
	UNION ALL
	SELECT Mr.ResvID,Mr.RoomID,Mr.LocationID,FromDate,ToDate,EmpID,'Available' as Status from MeetingRoom M
	left outer join MeetRoomReserved Mr on M.RoomID = Mr.RoomID
	where Mr.LocationID = @LocationID 
	--and Mr.FromDate = @FromDate and Mr.ToDate = @ToDate
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMeetingRoomReserv]    Script Date: 06/20/2018 19:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pradep
-- Create date: 19/06/2018
-- Description:	Retreive Meeting Room details
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetMeetingRoomReserv]
	-- Add the parameters for the stored procedure here
	@EmpID int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Mr.ResvID,Mr.RoomID,RoomName,Mr.LocationID,FromDate,ToDate,EmpID,NoofAttendees from dbo.MeetRoomReserved Mr inner join dbo.MeetingRoom M on Mr.RoomID = M.RoomID
	where Mr.EmpID = @EmpID 
END
GO
/****** Object:  ForeignKey [FK__MeetingRo__Locat__08EA5793]    Script Date: 06/20/2018 19:22:15 ******/
ALTER TABLE [dbo].[MeetingRoom]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
/****** Object:  ForeignKey [FK__MeetRoomR__EmpID__108B795B]    Script Date: 06/20/2018 19:22:15 ******/
ALTER TABLE [dbo].[MeetRoomReserved]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([EmpID])
GO
/****** Object:  ForeignKey [FK__MeetRoomR__Locat__0F975522]    Script Date: 06/20/2018 19:22:15 ******/
ALTER TABLE [dbo].[MeetRoomReserved]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
/****** Object:  ForeignKey [FK__MeetRoomR__RoomI__0EA330E9]    Script Date: 06/20/2018 19:22:15 ******/
ALTER TABLE [dbo].[MeetRoomReserved]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[MeetingRoom] ([RoomID])
GO
