CREATE TABLE [dbo].[earthquake_events_gold] (

	[id] varchar(8000) NULL, 
	[longitude] float NULL, 
	[latitude] float NULL, 
	[elevation] float NULL, 
	[title] varchar(8000) NULL, 
	[place_description] varchar(8000) NULL, 
	[sig] bigint NULL, 
	[mag] float NULL, 
	[magType] varchar(8000) NULL, 
	[time] datetime2(6) NULL, 
	[updated] datetime2(6) NULL, 
	[country_code] varchar(8000) NULL, 
	[sig_class] varchar(8000) NULL
);