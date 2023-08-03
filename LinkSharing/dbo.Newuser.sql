CREATE TABLE [dbo].[Newuser] (
    [UserName] NVARCHAR (60)  NOT NULL,
    [Email]    NVARCHAR (200) NOT NULL,
    [Contact]  NCHAR (20)     NOT NULL,
    [Password] NCHAR (50)     NOT NULL,
    CONSTRAINT [PK_Newuser] PRIMARY KEY CLUSTERED ([Email] ASC)
);

