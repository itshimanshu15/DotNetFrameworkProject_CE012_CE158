CREATE TABLE [dbo].[Newuser] (
    [Uid]      INT            IDENTITY (1, 1) NOT NULL,
    [UserName] NVARCHAR (60)  NOT NULL,
    [Email]    NVARCHAR (200) NOT NULL,
    [Contact]  NCHAR (20)     NOT NULL,
    [Password] NCHAR (50)     NOT NULL,
    PRIMARY KEY CLUSTERED ([Uid] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);

CREATE TABLE [dbo].[Category] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Uid]  INT            NULL,
    [Name] NVARCHAR (256) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserId] FOREIGN KEY ([Uid]) REFERENCES [dbo].[Newuser] ([Uid]) ON DELETE SET NULL
);

CREATE TABLE [dbo].[Urls] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [Uid]         INT             NULL,
    [Cid]         INT             NULL,
    [Link]        NVARCHAR (500)  NOT NULL,
    [Name]        NVARCHAR (500)  NOT NULL,
    [Description] NVARCHAR (2000) NULL,
    [Date]        DATE            DEFAULT (getdate()) NULL,
    [IsPublic]    BIT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserIdUrls] FOREIGN KEY ([Uid]) REFERENCES [dbo].[Newuser] ([Uid]) ON DELETE CASCADE,
    CONSTRAINT [FK_CatIdUrls] FOREIGN KEY ([Cid]) REFERENCES [dbo].[Category] ([Id]) ON DELETE SET NULL
);
