USE master;
GO

CREATE DATABASE c3NextGen;

GO

USE c3NextGen;

IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Form] (
    [Id] bigint NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    CONSTRAINT [PK_Form] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [CompletedForm] (
    [Id] bigint NOT NULL IDENTITY,
    [UserId] bigint NOT NULL,
    [CompletedDate] datetime2 NOT NULL,
    [FormId] bigint NOT NULL,
    CONSTRAINT [PK_CompletedForm] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompletedForm_Form_FormId] FOREIGN KEY ([FormId]) REFERENCES [Form] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [FormField] (
    [Id] bigint NOT NULL IDENTITY,
    [Column] int NOT NULL,
    [Row] int NOT NULL,
    [Width] int NOT NULL,
    [Height] int NOT NULL,
    [Headline] nvarchar(max) NULL,
    [Static] bit NOT NULL,
    [FormId] bigint NOT NULL,
    CONSTRAINT [PK_FormField] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_FormField_Form_FormId] FOREIGN KEY ([FormId]) REFERENCES [Form] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Component] (
    [Id] bigint NOT NULL IDENTITY,
    [ComponentName] nvarchar(25) NULL,
    [FormFieldId] bigint NOT NULL,
    CONSTRAINT [PK_Component] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Component_FormField_FormFieldId] FOREIGN KEY ([FormFieldId]) REFERENCES [FormField] ([Id]) ON DELETE CASCADE
);

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Form]'))
    SET IDENTITY_INSERT [Form] ON;
INSERT INTO [Form] ([Id], [Name])
VALUES (CAST(1 AS bigint), N'Brand'),
(CAST(2 AS bigint), N'Affaldssortering'),
(CAST(3 AS bigint), N'Biluheld'),
(CAST(4 AS bigint), N'Overfald'),
(CAST(5 AS bigint), N'Underet Borgmesterkontoret'),
(CAST(6 AS bigint), N'Kemikaliebrand'),
(CAST(7 AS bigint), N'Tilkald helikopter');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Form]'))
    SET IDENTITY_INSERT [Form] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompletedDate', N'FormId', N'UserId') AND [object_id] = OBJECT_ID(N'[CompletedForm]'))
    SET IDENTITY_INSERT [CompletedForm] ON;
INSERT INTO [CompletedForm] ([Id], [CompletedDate], [FormId], [UserId])
VALUES (CAST(1 AS bigint), '2019-05-27T00:00:00.0000000+02:00', CAST(1 AS bigint), CAST(1 AS bigint)),
(CAST(2 AS bigint), '2019-05-27T00:00:00.0000000+02:00', CAST(2 AS bigint), CAST(2 AS bigint)),
(CAST(3 AS bigint), '2019-05-27T00:00:00.0000000+02:00', CAST(3 AS bigint), CAST(3 AS bigint)),
(CAST(4 AS bigint), '2019-05-27T00:00:00.0000000+02:00', CAST(4 AS bigint), CAST(1 AS bigint)),
(CAST(5 AS bigint), '2019-05-27T00:00:00.0000000+02:00', CAST(5 AS bigint), CAST(2 AS bigint)),
(CAST(6 AS bigint), '2019-05-27T00:00:00.0000000+02:00', CAST(6 AS bigint), CAST(1 AS bigint)),
(CAST(7 AS bigint), '2019-05-27T00:00:00.0000000+02:00', CAST(7 AS bigint), CAST(1 AS bigint));
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompletedDate', N'FormId', N'UserId') AND [object_id] = OBJECT_ID(N'[CompletedForm]'))
    SET IDENTITY_INSERT [CompletedForm] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Column', N'FormId', N'Headline', N'Height', N'Row', N'Static', N'Width') AND [object_id] = OBJECT_ID(N'[FormField]'))
    SET IDENTITY_INSERT [FormField] ON;
INSERT INTO [FormField] ([Id], [Column], [FormId], [Headline], [Height], [Row], [Static], [Width])
VALUES (CAST(1 AS bigint), 3, CAST(1 AS bigint), N'Indtast Dit Navn', 3, 3, 0, 3),
(CAST(2 AS bigint), 2, CAST(2 AS bigint), N'Er der en affaldsspand', 3, 3, 0, 2),
(CAST(3 AS bigint), 3, CAST(3 AS bigint), N'Antal kv├ªstede', 4, 3, 0, 3),
(CAST(4 AS bigint), 3, CAST(4 AS bigint), N'Overfaldsv├Ñben', 5, 3, 0, 3),
(CAST(5 AS bigint), 3, CAST(5 AS bigint), N'Skal komunaldirekt├╕ren underrettes', 2, 3, 0, 5),
(CAST(6 AS bigint), 3, CAST(6 AS bigint), N'Hvilken type kemikalie er i brand?', 5, 3, 0, 5),
(CAST(7 AS bigint), 3, CAST(7 AS bigint), N'Hvor skal helikopteren lande?', 2, 3, 0, 3);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Column', N'FormId', N'Headline', N'Height', N'Row', N'Static', N'Width') AND [object_id] = OBJECT_ID(N'[FormField]'))
    SET IDENTITY_INSERT [FormField] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ComponentName', N'FormFieldId') AND [object_id] = OBJECT_ID(N'[Component]'))
    SET IDENTITY_INSERT [Component] ON;
INSERT INTO [Component] ([Id], [ComponentName], [FormFieldId])
VALUES (CAST(1 AS bigint), N'appInputFieldComponent', CAST(1 AS bigint)),
(CAST(2 AS bigint), N'appInputFieldComponent', CAST(2 AS bigint)),
(CAST(3 AS bigint), N'appInputFieldComponent', CAST(3 AS bigint)),
(CAST(4 AS bigint), N'appInputFieldComponent', CAST(4 AS bigint)),
(CAST(5 AS bigint), N'appInputFieldComponent', CAST(5 AS bigint)),
(CAST(6 AS bigint), N'appInputFieldComponent', CAST(6 AS bigint)),
(CAST(7 AS bigint), N'appInputFieldComponent', CAST(7 AS bigint));
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ComponentName', N'FormFieldId') AND [object_id] = OBJECT_ID(N'[Component]'))
    SET IDENTITY_INSERT [Component] OFF;

GO

CREATE INDEX [IX_CompletedForm_FormId] ON [CompletedForm] ([FormId]);

GO

CREATE UNIQUE INDEX [IX_Component_FormFieldId] ON [Component] ([FormFieldId]);

GO

CREATE INDEX [IX_FormField_FormId] ON [FormField] ([FormId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20190527081546_initialModel', N'2.2.3-servicing-35854');

GO


