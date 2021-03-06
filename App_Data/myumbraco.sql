-- Script Date: 15/09/2015 11:58  - ErikEJ.SqlCeScripting version 3.5.2.45
-- Database information:
-- Locale Identifier: 1040
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: umbraco.sdf
-- ServerVersion: 4.0.8876.1
-- DatabaseSize: 1,063 MB
-- Created: 07/09/2015 10:33

-- User Table information:
-- Number of tables: 41
-- cmsContent: 10 row(s)
-- cmsContentType: 13 row(s)
-- cmsContentType2ContentType: 8 row(s)
-- cmsContentTypeAllowedContentType: 11 row(s)
-- cmsContentVersion: 18 row(s)
-- cmsContentXml: 10 row(s)
-- cmsDataType: 27 row(s)
-- cmsDataTypePreValues: 13 row(s)
-- cmsDictionary: 0 row(s)
-- cmsDocument: 17 row(s)
-- cmsDocumentType: 8 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 5 row(s)
-- cmsMacroProperty: 0 row(s)
-- cmsMember: 0 row(s)
-- cmsMember2MemberGroup: 0 row(s)
-- cmsMemberType: 0 row(s)
-- cmsPreviewXml: 17 row(s)
-- cmsPropertyData: 89 row(s)
-- cmsPropertyType: 32 row(s)
-- cmsPropertyTypeGroup: 14 row(s)
-- cmsStylesheet: 0 row(s)
-- cmsStylesheetProperty: 0 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTask: 0 row(s)
-- cmsTaskType: 1 row(s)
-- cmsTemplate: 9 row(s)
-- umbracoDomains: 0 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLog: 236 row(s)
-- umbracoNode: 62 row(s)
-- umbracoRelation: 0 row(s)
-- umbracoRelationType: 1 row(s)
-- umbracoServer: 0 row(s)
-- umbracoUser: 1 row(s)
-- umbracoUser2app: 7 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2NodePermission: 0 row(s)
-- umbracoUserLogins: -1 row(s)
-- umbracoUserType: 4 row(s)

CREATE TABLE [umbracoUserType] (
  [id] int IDENTITY (5,1) NOT NULL
, [userTypeAlias] nvarchar(50) NULL
, [userTypeName] nvarchar(255) NOT NULL
, [userTypeDefaultPermissions] nvarchar(50) NULL
);
GO
CREATE TABLE [umbracoUserLogins] (
  [contextID] uniqueidentifier NOT NULL
, [userID] int NOT NULL
, [timeout] bigint NOT NULL
);
GO
CREATE TABLE [umbracoUser] (
  [id] int IDENTITY (1,1) NOT NULL
, [userDisabled] bit DEFAULT ('0') NOT NULL
, [userNoConsole] bit DEFAULT ('0') NOT NULL
, [userType] int NOT NULL
, [startStructureID] int NOT NULL
, [startMediaID] int NULL
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(500) NOT NULL
, [userEmail] nvarchar(255) NOT NULL
, [userLanguage] nvarchar(10) NULL
);
GO
CREATE TABLE [umbracoUser2app] (
  [user] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int IDENTITY (1,1) NOT NULL
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime DEFAULT (getdate()) NOT NULL
, [lastNotifiedDate] datetime NOT NULL
, [isActive] bit NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int IDENTITY (2,1) NOT NULL
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NOT NULL
, [childObjectType] uniqueidentifier NOT NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int IDENTITY (1081,1) NOT NULL
, [trashed] bit DEFAULT ('0') NOT NULL
, [parentID] int NOT NULL
, [nodeUser] int NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [uniqueID] uniqueidentifier NULL
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime DEFAULT (getdate()) NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodePermission] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int IDENTITY (1,1) NOT NULL
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime DEFAULT (getdate()) NOT NULL
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int IDENTITY (237,1) NOT NULL
, [userId] int NOT NULL
, [NodeId] int NOT NULL
, [Datestamp] datetime DEFAULT (getdate()) NOT NULL
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int IDENTITY (2,1) NOT NULL
, [languageISOCode] nvarchar(10) NULL
, [languageCultureName] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoDomains] (
  [id] int IDENTITY (1,1) NOT NULL
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int IDENTITY (10,1) NOT NULL
, [nodeId] int NOT NULL
, [master] int NULL
, [alias] nvarchar(100) NULL
, [design] ntext NOT NULL
);
GO
CREATE TABLE [cmsTaskType] (
  [id] int IDENTITY (1,1) NOT NULL
, [alias] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTask] (
  [closed] bit DEFAULT ('0') NOT NULL
, [id] int IDENTITY (1,1) NOT NULL
, [taskTypeId] int NOT NULL
, [nodeId] int NOT NULL
, [parentUserId] int NOT NULL
, [userId] int NOT NULL
, [DateTime] datetime DEFAULT (getdate()) NOT NULL
, [Comment] nvarchar(500) NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int IDENTITY (1,1) NOT NULL
, [tag] nvarchar(200) NULL
, [ParentId] int NULL
, [group] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsStylesheetProperty] (
  [nodeId] int NOT NULL
, [stylesheetPropertyEditor] bit NULL
, [stylesheetPropertyAlias] nvarchar(50) NULL
, [stylesheetPropertyValue] nvarchar(400) NULL
);
GO
CREATE TABLE [cmsStylesheet] (
  [nodeId] int NOT NULL
, [filename] nvarchar(100) NOT NULL
, [content] ntext NULL
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int IDENTITY (24,1) NOT NULL
, [parentGroupId] int NULL
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int IDENTITY (67,1) NOT NULL
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [helpText] nvarchar(1000) NULL
, [sortOrder] int DEFAULT ('0') NOT NULL
, [mandatory] bit DEFAULT ('0') NOT NULL
, [validationRegExp] nvarchar(255) NULL
, [Description] nvarchar(2000) NULL
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
, [propertyTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsPropertyData] (
  [id] int IDENTITY (91,1) NOT NULL
, [contentNodeId] int NOT NULL
, [versionId] uniqueidentifier NULL
, [propertytypeid] int NOT NULL
, [dataInt] int NULL
, [dataDate] datetime NULL
, [dataNvarchar] nvarchar(500) NULL
, [dataNtext] ntext NULL
);
GO
CREATE TABLE [cmsPreviewXml] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [timestamp] datetime NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int IDENTITY (1,1) NOT NULL
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit DEFAULT ('0') NOT NULL
, [viewOnProfile] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) DEFAULT ('''') NOT NULL
, [LoginName] nvarchar(1000) DEFAULT ('''') NOT NULL
, [Password] nvarchar(1000) DEFAULT ('''') NOT NULL
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int IDENTITY (10,1) NOT NULL
, [macroUseInEditor] bit DEFAULT ('0') NOT NULL
, [macroRefreshRate] int DEFAULT ('0') NOT NULL
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroScriptType] nvarchar(255) NULL
, [macroScriptAssembly] nvarchar(255) NULL
, [macroXSLT] nvarchar(255) NULL
, [macroCacheByPage] bit DEFAULT ('1') NOT NULL
, [macroCachePersonalized] bit DEFAULT ('0') NOT NULL
, [macroDontRender] bit DEFAULT ('0') NOT NULL
, [macroPython] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int IDENTITY (1,1) NOT NULL
, [editorAlias] nvarchar(255) NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int DEFAULT ('0') NOT NULL
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int IDENTITY (1,1) NOT NULL
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [documentUser] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [text] nvarchar(255) NOT NULL
, [releaseDate] datetime NULL
, [expireDate] datetime NULL
, [updateDate] datetime DEFAULT (getdate()) NOT NULL
, [templateId] int NULL
, [newest] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int IDENTITY (1,1) NOT NULL
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NOT NULL
, [key] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDataTypePreValues] (
  [id] int IDENTITY (14,1) NOT NULL
, [datatypeNodeId] int NOT NULL
, [value] ntext NULL
, [sortorder] int NOT NULL
, [alias] nvarchar(50) NULL
);
GO
CREATE TABLE [cmsDataType] (
  [pk] int IDENTITY (32,1) NOT NULL
, [nodeId] int NOT NULL
, [propertyEditorAlias] nvarchar(255) NOT NULL
, [dbType] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [cmsContentXml] (
  [nodeId] int NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsContentVersion] (
  [id] int IDENTITY (19,1) NOT NULL
, [ContentId] int NOT NULL
, [VersionId] uniqueidentifier NOT NULL
, [VersionDate] datetime DEFAULT (getdate()) NOT NULL
, [LanguageLocale] nvarchar(10) NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int IDENTITY (545,1) NOT NULL
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) DEFAULT ('folder.png') NOT NULL
, [description] nvarchar(1500) NULL
, [isContainer] bit DEFAULT ('0') NOT NULL
, [allowAtRoot] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsContent] (
  [pk] int IDENTITY (11,1) NOT NULL
, [nodeId] int NOT NULL
, [contentType] int NOT NULL
);
GO
SET IDENTITY_INSERT [umbracoUserType] ON;
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F7');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (2,N'writer',N'Writer',N'CAH:F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (3,N'editor',N'Editors',N'CADMOSKTPUZ:5F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (4,N'translator',N'Translator',N'AF');
GO
SET IDENTITY_INSERT [umbracoUserType] OFF;
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userType],[startStructureID],[startMediaID],[userName],[userLogin],[userPassword],[userEmail],[userLanguage]) VALUES (0,0,0,1,-1,-1,N'Valerio',N'v.zanibellato@outlook.com',N'LCsQb84eg25PdNLUEk3zW04Cw/E=',N'v.zanibellato@outlook.com',N'en');
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'content');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'developer');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'forms');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'media');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'member');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'settings');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'users');
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (1,1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-97,0,-1,0,1,N'-1,-97',2,'aa2c52a0-ce87-4e65-a47c-7df09358585d',N'List View - Members','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-96,0,-1,0,1,N'-1,-96',2,'3a0156c4-3b8c-4803-bdc1-6871faa83fff',N'List View - Media','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-95,0,-1,0,1,N'-1,-95',2,'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4',N'List View - Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-92,0,-1,0,1,N'-1,-92',35,'f0bc4bfb-b499-40d6-ba86-058885a5178c',N'Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-90,0,-1,0,1,N'-1,-90',34,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-89,0,-1,0,1,N'-1,-89',33,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',N'Textbox multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-88,0,-1,0,1,N'-1,-88',32,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-87,0,-1,0,1,N'-1,-87',4,'ca90c950-0aff-4e72-b976-a30b1ac57dad',N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-51,0,-1,0,1,N'-1,-51',2,'2e6d3631-066e-44b8-aec4-96f09099b2b5',N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-49,0,-1,0,1,N'-1,-49',2,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',N'True/false','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-43,0,-1,0,1,N'-1,-43',2,'fbaf13a8-4036-41f2-93a3-974f678c312a',N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-42,0,-1,0,1,N'-1,-42',2,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-41,0,-1,0,1,N'-1,-41',2,'5046194e-4237-453c-a547-15db3a07c4e1',N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-40,0,-1,0,1,N'-1,-40',2,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-39,0,-1,0,1,N'-1,-39',2,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-38,0,-1,0,1,N'-1,-38',2,'fd9f1447-6c61-4a7c-9595-5aa39147d318',N'Folder Browser','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-37,0,-1,0,1,N'-1,-37',2,'0225af17-b302-49cb-9176-b9f35cab9c17',N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-36,0,-1,0,1,N'-1,-36',2,'e4d66c0f-b935-4200-81f0-025f7256b89a',N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-21,0,-1,0,0,N'-1,-21',0,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-20,0,-1,0,0,N'-1,-20',0,'0f582a79-1e41-4cf0-bfa0-76340651891a',N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2015-09-07 10:33:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-1,0,-1,0,0,N'-1',0,'916724a5-173d-4619-b97e-b9de133dd6f5',N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2015-09-07 10:33:46.967'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1031,0,-1,0,1,N'-1,1031',2,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1032,0,-1,0,1,N'-1,1032',2,'cc07b313-0843-4aa8-bbda-871c8da728c8',N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1033,0,-1,0,1,N'-1,1033',2,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1034,0,-1,0,1,N'-1,1034',2,'a6857c73-d6e9-480c-b6e6-f15f6ad11125',N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1035,0,-1,0,1,N'-1,1035',2,'93929b9a-93a2-4e2a-b239-d99334440a59',N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1036,0,-1,0,1,N'-1,1036',2,'2b24165f-9782-4aa3-b459-1de4a4d21f60',N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1040,0,-1,0,1,N'-1,1040',2,'21e798da-e06e-4eda-a511-ed257f78d4fa',N'Related Links','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1041,0,-1,0,1,N'-1,1041',2,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1043,0,-1,0,1,N'-1,1043',2,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1044,0,-1,0,1,N'-1,1044',0,'d59be02f-1df9-4228-aa1e-01917d806cda',N'Member','9b5416fb-e72f-45a9-a07b-5a9a2709ce43',{ts '2015-09-07 10:33:46.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1045,0,-1,0,1,N'-1,1045',2,'7e3962cc-ce20-4ffc-b661-5897a894ba7e',N'Multiple Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:33:46.983'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1050,0,-1,0,1,N'-1,1050',0,'7ff6e741-befb-44e4-84b1-5c5ee3a3d737',N'Master','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-07 10:35:29.620'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1051,0,-1,0,1,N'-1,1051',0,'005b2ebc-aadc-4072-8b69-fea6fa42a994',N'Home Page','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-07 10:38:59.890'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1052,0,1050,0,2,N'-1,1050,1052',0,'ab71f0aa-807b-488d-bc95-8360be968ea6',N'Home Page','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-07 10:38:59.933'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1053,0,-1,0,1,N'-1,1053',0,'0b012ac2-9009-4183-b6f0-4ca8bdd340dc',N'Text Page','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-07 10:42:56.807'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1054,0,1050,0,2,N'-1,1050,1054',1,'462165d2-ffac-44fe-a5eb-36d81ca81a0e',N'Text Page','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-07 10:42:56.820'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1055,0,-1,0,1,N'-1,1055',0,'f7729f1d-af2d-450f-83f7-8539c9964f7f',N'Article Main','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-07 10:43:57.613'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1056,0,1050,0,2,N'-1,1050,1056',2,'05e5aa9b-7610-4a26-80b0-e9d582df3f52',N'Article Main','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-07 10:43:57.627'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1057,0,-1,0,1,N'-1,1057',0,'cd9e324c-875f-4833-ae2b-6fa686b604a1',N'Article Item','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-07 10:46:39.520'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1058,0,1050,0,2,N'-1,1050,1058',3,'6af43724-10c3-4ef2-a89e-b473fa89dc96',N'Article Item','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-07 10:46:39.537'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1059,0,-1,0,1,N'-1,1059',0,'616e87a2-d1d3-4358-8fe3-f4a7ce9b752d',N'Projects Main','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-07 10:49:10.273'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1060,0,1050,0,2,N'-1,1050,1060',4,'3f82194f-84a1-4b0a-960e-dc20c73ad974',N'Projects Main','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-07 10:49:10.290'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1061,0,-1,0,1,N'-1,1061',0,'ef929c66-afcc-4a82-beb2-19077319f31f',N'Project Item','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-07 10:50:25.267'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1062,0,1050,0,2,N'-1,1050,1062',5,'1828b30e-dd29-40f5-87f8-1eed031a1cca',N'Project Item','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-07 10:50:25.283'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1064,0,-1,0,1,N'-1,1064',25,'2b54f763-40e6-4305-8c78-7afedbfea4cc',N'Status','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-07 10:58:48.467'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1065,0,-1,0,1,N'-1,1065',0,'f4a2560b-1f6a-4a02-943f-9670b723027e',N'Web Coop Home','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-08 08:50:18.763'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1066,0,-1,0,1,N'-1,1066',1,'8c248004-9376-4fbd-b44d-bd86f7080711',N'Master','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-08 11:12:38.647'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1067,0,-1,0,1,N'-1,1067',1,'488179c2-7fbd-48ef-8f7a-84e564ed39af',N'About','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-11 09:34:03.770'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1068,0,1050,0,2,N'-1,1050,1068',6,'dcfcb53a-019a-49bd-b5e6-2293bf234d84',N'About','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-11 09:34:03.900'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1069,0,1065,0,2,N'-1,1065,1069',0,'db377a0a-05dc-4f82-93b7-756a5818c927',N'Articles','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-11 09:40:52.963'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1070,0,1069,0,3,N'-1,1065,1069,1070',0,'1c0c5307-534d-42e1-a010-186fe5e5ccd7',N'The first article','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-11 09:42:27.440'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1071,0,1069,0,3,N'-1,1065,1069,1071',1,'b393b559-f722-4723-acfb-85b89e01df9f',N'The second article','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-11 09:43:01.483'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1072,0,1065,0,2,N'-1,1065,1072',1,'0cee9ee5-8275-4c6d-9a73-7e7eb0ddd957',N'Projects','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-11 10:47:09.770'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1073,0,1072,0,3,N'-1,1065,1072,1073',0,'fd9ece8d-0d0e-42ba-8e5a-383b6504b36d',N'The first project','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-11 10:48:10.517'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1074,0,1072,0,3,N'-1,1065,1072,1074',1,'15d51635-a878-43c2-848b-c71e6b941fe4',N'The second project','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-11 10:48:33.673'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1075,0,-1,0,1,N'-1,1075',26,'28d98ff3-e03b-4e3f-9f3a-e64d2b25e7dd',N'Grid Info Page','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2015-09-13 14:20:50.747'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1076,0,-1,0,1,N'-1,1076',1,'23ecbd93-394c-42dd-a953-dc231b44f73c',N'Grid Info Page','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2015-09-13 14:22:03.087'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1077,0,1050,0,2,N'-1,1050,1077',7,'72c55c70-d0bd-490e-bbb5-67cd33e205c4',N'Grid Info Page','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2015-09-13 14:22:03.150'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1078,0,1065,0,2,N'-1,1065,1078',2,'df10468b-fd4a-4d7e-b6a8-d502abe7a43c',N'About Us','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-13 14:25:14.373'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1079,0,-1,0,1,N'-1,1079',0,'a241900f-51bc-432e-a91c-10949cfbdf8b',N'design1.png','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2015-09-13 14:33:50.390'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1080,0,1072,0,3,N'-1,1065,1072,1080',2,'0d549813-470c-4a66-a44b-e77e89459183',N'The first completed project','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2015-09-13 17:00:49.827'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (1,0,1050,{ts '2015-09-07 10:35:29.720'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (2,0,1050,{ts '2015-09-07 10:35:46.880'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (3,0,1050,{ts '2015-09-07 10:36:36.983'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (4,0,1050,{ts '2015-09-07 10:37:04.853'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (5,0,1050,{ts '2015-09-07 10:37:12.947'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (6,0,1052,{ts '2015-09-07 10:38:59.947'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (7,0,1052,{ts '2015-09-07 10:39:26.997'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (8,0,1052,{ts '2015-09-07 10:41:29.290'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (9,0,1052,{ts '2015-09-07 10:41:48.720'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (10,0,1052,{ts '2015-09-07 10:42:01.563'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (11,0,1052,{ts '2015-09-07 10:42:18.090'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (12,0,1054,{ts '2015-09-07 10:42:56.833'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (13,0,1054,{ts '2015-09-07 10:43:05.543'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (14,0,1054,{ts '2015-09-07 10:43:26.910'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (15,0,1056,{ts '2015-09-07 10:43:57.640'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (16,0,1056,{ts '2015-09-07 10:45:03.100'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (17,0,1056,{ts '2015-09-07 10:45:35.003'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (18,0,1056,{ts '2015-09-07 10:45:49.693'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (19,0,1058,{ts '2015-09-07 10:46:39.547'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (20,0,1058,{ts '2015-09-07 10:46:57.567'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (21,0,1058,{ts '2015-09-07 10:47:17.050'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (22,0,1058,{ts '2015-09-07 10:47:38.167'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (23,0,1056,{ts '2015-09-07 10:48:16.387'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (24,0,1052,{ts '2015-09-07 10:48:43.477'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (25,0,1060,{ts '2015-09-07 10:49:10.300'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (26,0,1060,{ts '2015-09-07 10:49:22.430'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (27,0,1060,{ts '2015-09-07 10:49:44.890'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (28,0,1060,{ts '2015-09-07 10:50:10.017'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (29,0,1062,{ts '2015-09-07 10:50:25.293'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (30,0,1062,{ts '2015-09-07 10:50:51.200'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (31,0,1062,{ts '2015-09-07 10:51:10.257'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (32,0,1062,{ts '2015-09-07 10:51:28.433'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (33,0,1060,{ts '2015-09-07 10:51:43.747'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (34,0,1063,{ts '2015-09-07 10:55:31.017'},N'Save',N'Save MediaType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (35,0,1063,{ts '2015-09-07 10:55:56.310'},N'Save',N'Save MediaType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (36,0,-1,{ts '2015-09-07 10:56:38.150'},N'Delete',N'Delete Media items by Type performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (37,0,1063,{ts '2015-09-07 10:56:38.167'},N'Delete',N'Delete MediaType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (38,0,1064,{ts '2015-09-07 10:58:48.483'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (39,0,1064,{ts '2015-09-07 11:01:42.877'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (40,0,1062,{ts '2015-09-07 11:02:29.910'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (41,0,1052,{ts '2015-09-08 08:48:41.643'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (42,0,0,{ts '2015-09-08 08:48:52.230'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (43,0,1065,{ts '2015-09-08 08:50:19.010'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (44,0,1058,{ts '2015-09-08 09:05:26.770'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (45,0,1058,{ts '2015-09-08 09:05:28.167'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (46,0,1054,{ts '2015-09-08 09:05:36.167'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (47,0,1060,{ts '2015-09-08 09:05:44.190'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (48,0,1062,{ts '2015-09-08 09:05:51.667'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (49,0,1056,{ts '2015-09-08 09:06:04.107'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (50,0,0,{ts '2015-09-08 09:06:19.883'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (51,0,1050,{ts '2015-09-08 09:54:43.270'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (52,0,1052,{ts '2015-09-08 09:55:00.490'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (53,0,1065,{ts '2015-09-08 09:55:35.523'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (54,0,1068,{ts '2015-09-11 09:34:04.127'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (55,0,1068,{ts '2015-09-11 09:34:17.457'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (56,0,1068,{ts '2015-09-11 09:34:41.250'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (57,0,0,{ts '2015-09-11 09:38:55.310'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (58,0,1069,{ts '2015-09-11 09:40:53.127'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (59,0,0,{ts '2015-09-11 09:42:03.943'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (60,0,1070,{ts '2015-09-11 09:42:27.483'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (61,0,0,{ts '2015-09-11 09:42:31.960'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (62,0,1071,{ts '2015-09-11 09:43:01.517'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (63,0,1071,{ts '2015-09-11 09:44:07.587'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (64,0,-1,{ts '2015-09-11 09:54:00.500'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (65,0,-1,{ts '2015-09-11 09:54:00.547'},N'Save',N'Save Macro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (66,0,-1,{ts '2015-09-11 09:55:23.337'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (67,0,-1,{ts '2015-09-11 09:56:00.260'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (68,0,-1,{ts '2015-09-11 09:56:23.287'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (69,0,1058,{ts '2015-09-11 10:28:57.027'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (70,0,1056,{ts '2015-09-11 10:30:05.703'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (71,0,1052,{ts '2015-09-11 10:37:14.390'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (72,0,1060,{ts '2015-09-11 10:37:28.637'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (73,0,1060,{ts '2015-09-11 10:37:45.853'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (74,0,1062,{ts '2015-09-11 10:37:54.957'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (75,0,1056,{ts '2015-09-11 10:38:20.610'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (76,0,1058,{ts '2015-09-11 10:38:32.520'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (77,0,1054,{ts '2015-09-11 10:41:03.563'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (78,0,1052,{ts '2015-09-11 10:44:29.367'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (79,0,0,{ts '2015-09-11 10:46:41.283'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (80,0,1072,{ts '2015-09-11 10:47:09.807'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (81,0,1069,{ts '2015-09-11 10:47:29.240'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (82,0,1072,{ts '2015-09-11 10:47:36.727'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (83,0,0,{ts '2015-09-11 10:47:42.720'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (84,0,1073,{ts '2015-09-11 10:48:10.573'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (85,0,0,{ts '2015-09-11 10:48:17.823'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (86,0,1074,{ts '2015-09-11 10:48:33.710'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (87,0,1074,{ts '2015-09-11 10:49:14.097'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (88,0,1060,{ts '2015-09-11 10:50:28.047'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (89,0,1062,{ts '2015-09-11 10:51:02.180'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (90,0,1062,{ts '2015-09-11 10:52:11.547'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (91,0,1073,{ts '2015-09-11 10:52:40.327'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (92,0,1074,{ts '2015-09-11 10:52:52.287'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (93,0,-1,{ts '2015-09-11 10:57:01.677'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (94,0,-1,{ts '2015-09-11 10:57:01.687'},N'Save',N'Save Macro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (95,0,-1,{ts '2015-09-11 10:57:18.887'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (96,0,-1,{ts '2015-09-11 10:57:33.723'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (97,0,-1,{ts '2015-09-11 10:58:28.777'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (98,0,-1,{ts '2015-09-11 11:00:13.697'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (99,0,1070,{ts '2015-09-11 11:02:09.617'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (100,0,-1,{ts '2015-09-11 11:03:33.207'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (101,0,-1,{ts '2015-09-11 11:03:38.903'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (102,0,-1,{ts '2015-09-11 11:12:38.723'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (103,0,-1,{ts '2015-09-11 11:12:38.737'},N'Save',N'Save Macro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (104,0,-1,{ts '2015-09-11 11:13:22.557'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (105,0,-1,{ts '2015-09-11 11:16:15.137'},N'Delete',N'Delete PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (106,0,-1,{ts '2015-09-11 11:17:05.623'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (107,0,-1,{ts '2015-09-11 11:18:44.697'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (108,0,-1,{ts '2015-09-11 11:19:28.077'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (109,0,-1,{ts '2015-09-11 11:47:35.087'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (110,0,-1,{ts '2015-09-11 11:49:23.360'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (111,0,-1,{ts '2015-09-11 11:53:50.907'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (112,0,-1,{ts '2015-09-11 11:55:26.393'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (113,0,-1,{ts '2015-09-11 11:55:36.457'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (114,0,-1,{ts '2015-09-11 11:57:47.920'},N'Delete',N'Delete PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (115,0,-1,{ts '2015-09-11 11:58:22.183'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (116,0,-1,{ts '2015-09-11 12:00:55.607'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (117,0,-1,{ts '2015-09-13 09:59:48.567'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (118,0,-1,{ts '2015-09-13 09:59:48.627'},N'Save',N'Save Macro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (119,0,-1,{ts '2015-09-13 09:59:57.643'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (120,0,-1,{ts '2015-09-13 10:01:42.537'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (121,0,-1,{ts '2015-09-13 10:02:16.987'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (122,0,-1,{ts '2015-09-13 10:02:27.493'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (123,0,-1,{ts '2015-09-13 10:03:53.447'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (124,0,-1,{ts '2015-09-13 10:05:05.810'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (125,0,-1,{ts '2015-09-13 10:06:24.883'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (126,0,-1,{ts '2015-09-13 10:07:52.047'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (127,0,-1,{ts '2015-09-13 10:11:39.583'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (128,0,-1,{ts '2015-09-13 10:12:06.053'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (129,0,-1,{ts '2015-09-13 10:12:31.260'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (130,0,-1,{ts '2015-09-13 10:13:06.857'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (131,0,-1,{ts '2015-09-13 10:13:20.590'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (132,0,-1,{ts '2015-09-13 10:13:56.237'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (133,0,-1,{ts '2015-09-13 10:18:28.890'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (134,0,-1,{ts '2015-09-13 10:19:31.797'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (135,0,-1,{ts '2015-09-13 10:43:49.577'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (136,0,-1,{ts '2015-09-13 11:03:10.907'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (137,0,-1,{ts '2015-09-13 11:03:33.273'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (138,0,-1,{ts '2015-09-13 11:04:44.833'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (139,0,-1,{ts '2015-09-13 11:04:56.913'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (140,0,-1,{ts '2015-09-13 11:08:24.513'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (141,0,-1,{ts '2015-09-13 11:09:25.287'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (142,0,-1,{ts '2015-09-13 11:09:40.020'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (143,0,-1,{ts '2015-09-13 11:09:57.567'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (144,0,-1,{ts '2015-09-13 11:11:13.293'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (145,0,-1,{ts '2015-09-13 11:12:22.080'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (146,0,-1,{ts '2015-09-13 11:13:09.250'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (147,0,-1,{ts '2015-09-13 11:13:49.973'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (148,0,-1,{ts '2015-09-13 11:15:21.403'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (149,0,-1,{ts '2015-09-13 11:15:47.167'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (150,0,-1,{ts '2015-09-13 11:17:42.760'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (151,0,-1,{ts '2015-09-13 11:18:01.060'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (152,0,-1,{ts '2015-09-13 11:19:18.427'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (153,0,-1,{ts '2015-09-13 11:20:20.933'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (154,0,-1,{ts '2015-09-13 11:20:47.717'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (155,0,-1,{ts '2015-09-13 11:22:06.563'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (156,0,-1,{ts '2015-09-13 11:26:41.110'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (157,0,-1,{ts '2015-09-13 11:30:55.757'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (158,0,-1,{ts '2015-09-13 11:48:54.447'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (159,0,-1,{ts '2015-09-13 11:49:30.980'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (160,0,-1,{ts '2015-09-13 11:52:27.420'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (161,0,-1,{ts '2015-09-13 11:58:14.957'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (162,0,-1,{ts '2015-09-13 11:59:06.770'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (163,0,-1,{ts '2015-09-13 12:00:11.927'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (164,0,-1,{ts '2015-09-13 12:00:46.680'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (165,0,-1,{ts '2015-09-13 12:01:26.793'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (166,0,-1,{ts '2015-09-13 12:02:04.560'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (167,0,-1,{ts '2015-09-13 12:02:17.097'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (168,0,-1,{ts '2015-09-13 12:03:05.370'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (169,0,1075,{ts '2015-09-13 14:20:50.840'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (170,0,1077,{ts '2015-09-13 14:22:03.257'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (171,0,1077,{ts '2015-09-13 14:22:24.070'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (172,0,1077,{ts '2015-09-13 14:22:59.683'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (173,0,1052,{ts '2015-09-13 14:24:07.873'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (174,0,0,{ts '2015-09-13 14:24:21.320'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (175,0,1078,{ts '2015-09-13 14:25:14.517'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (176,0,1078,{ts '2015-09-13 14:25:54.220'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (177,0,1075,{ts '2015-09-13 14:28:49.730'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (178,0,0,{ts '2015-09-13 14:33:50.100'},N'New',N'Media ''design1.png'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (179,0,1079,{ts '2015-09-13 14:33:50.430'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (180,0,1078,{ts '2015-09-13 14:36:18.353'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (181,0,1078,{ts '2015-09-13 14:36:42.570'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (182,0,-1,{ts '2015-09-13 14:41:29.427'},N'Save',N'Save PartialView performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (183,0,1077,{ts '2015-09-13 14:44:48.810'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (184,0,1052,{ts '2015-09-13 14:45:07.927'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (185,0,1078,{ts '2015-09-13 14:45:28.640'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (186,0,1078,{ts '2015-09-13 14:45:31.057'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (187,0,-1,{ts '2015-09-13 14:48:19.883'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (188,0,1050,{ts '2015-09-13 14:52:02.637'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (189,0,-1,{ts '2015-09-13 14:52:45.990'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (190,0,1052,{ts '2015-09-13 14:52:46.010'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (191,0,1050,{ts '2015-09-13 14:53:03.073'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (192,0,1050,{ts '2015-09-13 14:53:15.017'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (193,0,1050,{ts '2015-09-13 14:53:23.267'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (194,0,1052,{ts '2015-09-13 14:53:58.763'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (195,0,1052,{ts '2015-09-13 14:54:01.533'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (196,0,1065,{ts '2015-09-13 14:55:05.543'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (197,0,-1,{ts '2015-09-13 16:19:35.090'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (198,0,-1,{ts '2015-09-13 16:20:05.890'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (199,0,-1,{ts '2015-09-13 16:20:32.520'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (200,0,-1,{ts '2015-09-13 16:22:03.170'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (201,0,-1,{ts '2015-09-13 16:25:37.007'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (202,0,-1,{ts '2015-09-13 16:26:10.493'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (203,0,-1,{ts '2015-09-13 16:36:11.840'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (204,0,-1,{ts '2015-09-13 16:38:53.550'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (205,0,-1,{ts '2015-09-13 16:39:43.647'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (206,0,-1,{ts '2015-09-13 16:40:38.690'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (207,0,-1,{ts '2015-09-13 16:40:44.397'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (208,0,-1,{ts '2015-09-13 16:41:26.220'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (209,0,-1,{ts '2015-09-13 16:42:21.330'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (210,0,-1,{ts '2015-09-13 16:47:25.623'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (211,0,-1,{ts '2015-09-13 16:48:57.473'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (212,0,-1,{ts '2015-09-13 16:51:00.273'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (213,0,-1,{ts '2015-09-13 16:51:16.813'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (214,0,-1,{ts '2015-09-13 16:53:39.553'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (215,0,-1,{ts '2015-09-13 16:55:59.767'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (216,0,-1,{ts '2015-09-13 16:58:21.507'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (217,0,-1,{ts '2015-09-13 16:59:37.640'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (218,0,0,{ts '2015-09-13 17:00:12.863'},N'New',N'Content '''' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (219,0,1080,{ts '2015-09-13 17:00:49.953'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (220,0,1073,{ts '2015-09-13 17:01:07.200'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (221,0,1080,{ts '2015-09-13 17:01:17.567'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (222,0,1080,{ts '2015-09-13 17:01:46.010'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (223,0,1080,{ts '2015-09-13 17:02:16.703'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (224,0,-1,{ts '2015-09-13 17:04:17.603'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (225,0,-1,{ts '2015-09-13 17:05:29.197'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (226,0,-1,{ts '2015-09-15 08:36:51.387'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (227,0,-1,{ts '2015-09-15 08:50:49.557'},N'Delete',N'Delete PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (228,0,-1,{ts '2015-09-15 08:52:24.703'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (229,0,-1,{ts '2015-09-15 08:53:14.633'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (230,0,-1,{ts '2015-09-15 08:55:49.793'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (231,0,-1,{ts '2015-09-15 09:00:28.583'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (232,0,1065,{ts '2015-09-15 09:06:29.957'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (233,0,-1,{ts '2015-09-15 09:31:35.717'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (234,0,-1,{ts '2015-09-15 09:43:23.573'},N'Save',N'Save PartialViewMacro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (235,0,-1,{ts '2015-09-15 09:43:23.623'},N'Save',N'Save Macro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (236,0,-1,{ts '2015-09-15 09:43:40.760'},N'Save',N'Save PartialViewMacro performed by user');
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName]) VALUES (1,N'en-US',N'en-US');
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
SET IDENTITY_INSERT [umbracoDomains] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] ON;
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (1,1051,1066,N'HomePage',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}
<section class="container">
	<div class="row">
		<div class="col-md-12">
		<h1>@Umbraco.Field("siteTitle")</h1>
		<p>@Umbraco.Field("mainContent")</p>
		</div>
	</div>
	<div class="row">
		@Umbraco.RenderMacro("recentProjectsTwo")
	</div>
</section>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (2,1053,1066,N'TextPage',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}
<div id="main-container">
    <div id="main" class="wrapper clearfix">
        <section>
            <h2></h2>
            <p></p>
        </section>  
    </div> <!-- #main -->
</div> <!-- #main-container -->');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (3,1055,1066,N'ArticleMain',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>@Umbraco.Field("articlesTitle")</h2>
            <p>@Umbraco.Field("articlesBodyText")</p>
        </div>
    </div> <!-- #main -->
	@Umbraco.RenderMacro("listArticles")
</div> <!-- #main-container -->');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (4,1057,1066,N'ArticleItem',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>@Umbraco.Field("articleTitle")</h2>
            <p>@Umbraco.Field("articleContents")</p>
			<p class="text-muted">@Umbraco.Field("status")</p>
     	</div>
	</div>
</div> <!-- #main -->');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (5,1059,1066,N'ProjectsMain',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>@Umbraco.Field("projectsTitle")</h2>
            <p>@Umbraco.Field("projectsBodyText")</p>
        </div>
    </div> <!-- #main -->
	@Umbraco.RenderMacro("listProjects")
</div> <!-- #main-container -->');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (6,1061,1066,N'ProjectItem',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>@Umbraco.Field("projectTitle")</h2>
            <p>@Umbraco.Field("projectContents")</p>
			<p class="text-muted">Status: @Umbraco.Field("status")</p>
     	</div>
	</div>
</div> <!-- #main -->');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (7,1066,NULL,N'Master',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
}
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<title>@Umbraco.Field("siteTitle", recursive: true)</title>
	<meta name="description" content="@Umbraco.Field("metaDescription", recursive: true)">
	<meta name="keywords" content="@Umbraco.Field("metaKeywords", recursive: true)">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="/content/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="/">Home</a>
		</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!-- Collect the nav links, forms, and other content for toggling -->
			
				  @Umbraco.RenderMacro("mainMenu")
				
			</div>
	  </div><!-- /.container-fluid -->
	</nav>
		
	@RenderBody()
	
	<footer class="navbar navbar-inverse navbar-fixed-bottom">
      <div class="container">
        <p class="text-muted">@Umbraco.Field("footerText", recursive: true)</p>
      </div>
    </footer>
	<script src="/Scripts/jquery-2.1.4.min.js"></script>
	<script src="/Scripts/bootstrap.min.js"></script>
</body>
</html>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (8,1067,1066,N'About',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (9,1076,1066,N'GridInfoPage',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("gridInfoPage","Bootstrap3");');
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [cmsTaskType] ON;
GO
INSERT INTO [cmsTaskType] ([id],[alias]) VALUES (1,N'toTranslate');
GO
SET IDENTITY_INSERT [cmsTaskType] OFF;
GO
SET IDENTITY_INSERT [cmsTask] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (3,NULL,1032,N'Image',1);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (4,NULL,1033,N'File',1);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (5,NULL,1031,N'Contents',1);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (11,NULL,1044,N'Membership',1);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (12,NULL,1050,N'SEO',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (13,NULL,1052,N'Content',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (15,NULL,1054,N'Content',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (16,NULL,1056,N'Intro',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (17,NULL,1058,N'Contents',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (18,NULL,1060,N'Intro',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (19,NULL,1062,N'Contents',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (21,NULL,1068,N'Content',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (22,NULL,1077,N'Contents',0);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (23,NULL,1050,N'Footer',1);
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (6,-90,1032,3,N'umbracoFile',N'Upload image',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (7,-92,1032,3,N'umbracoWidth',N'Width',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (8,-92,1032,3,N'umbracoHeight',N'Height',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (9,-92,1032,3,N'umbracoBytes',N'Size',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (10,-92,1032,3,N'umbracoExtension',N'Type',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (24,-90,1033,4,N'umbracoFile',N'Upload file',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (25,-92,1033,4,N'umbracoExtension',N'Type',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (26,-92,1033,4,N'umbracoBytes',N'Size',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (27,-38,1031,5,N'contents',N'Contents:',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (28,-89,1044,11,N'umbracoMemberComments',N'Comments',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (29,-92,1044,11,N'umbracoMemberFailedPasswordAttempts',N'Failed Password Attempts',NULL,1,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (30,-49,1044,11,N'umbracoMemberApproved',N'Is Approved',NULL,2,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (31,-49,1044,11,N'umbracoMemberLockedOut',N'Is Locked Out',NULL,3,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (32,-92,1044,11,N'umbracoMemberLastLockoutDate',N'Last Lockout Date',NULL,4,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (33,-92,1044,11,N'umbracoMemberLastLogin',N'Last Login Date',NULL,5,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (34,-92,1044,11,N'umbracoMemberLastPasswordChangeDate',N'Last Password Change Date',NULL,6,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (50,-89,1050,12,N'metaDescription',N'Meta Description',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (51,-89,1050,12,N'metaKeywords',N'Meta Keywords',NULL,1,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (52,-88,1052,13,N'siteTitle',N'Site Title',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (53,-87,1052,13,N'mainContent',N'Main Content',NULL,1,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (55,-89,1054,15,N'bodyText',N'Body Text',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (56,-88,1056,16,N'articlesTitle',N'Articles Title',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (57,-87,1056,16,N'articlesBodyText',N'Articles Body Text',NULL,1,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (58,-88,1058,17,N'articleTitle',N'Article Title',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (59,-87,1058,17,N'articleContents',N'Article Contents',NULL,1,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (60,-88,1060,18,N'projectsTitle',N'Projects Title',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (61,-87,1060,18,N'projectsBodyText',N'Projects Body text',NULL,1,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (62,-88,1062,19,N'projectTitle',N'Project Title',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (63,-87,1062,19,N'projectContents',N'Project Contents',NULL,1,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (64,1064,1062,19,N'status',N'Status',NULL,2,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (65,1075,1077,22,N'gridInfoPage',N'Grid info page',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (66,-88,1050,23,N'footerText',N'Footer Text',NULL,0,0,N'',N'');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyData] ON;
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (1,1065,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',50,NULL,NULL,NULL,N'Aarhus Web Developer');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (2,1065,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',51,NULL,NULL,NULL,N'Aarhus Web Developer');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (3,1065,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',52,NULL,NULL,N'Aarhus Web Developer',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (4,1065,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',53,NULL,NULL,NULL,N'<p>Welcome to Aarhus Web Developer Coop</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (6,1069,'ab636d17-4ff4-4952-9c79-a928eb315e3e',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (7,1069,'ab636d17-4ff4-4952-9c79-a928eb315e3e',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (8,1069,'ab636d17-4ff4-4952-9c79-a928eb315e3e',56,NULL,NULL,N'This page contains the articles.',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (9,1069,'ab636d17-4ff4-4952-9c79-a928eb315e3e',57,NULL,NULL,NULL,N'<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (10,1070,'7184308e-79bd-463a-8970-9657b4a7ed6d',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (11,1070,'7184308e-79bd-463a-8970-9657b4a7ed6d',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (12,1070,'7184308e-79bd-463a-8970-9657b4a7ed6d',58,NULL,NULL,N'The first article',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (13,1070,'7184308e-79bd-463a-8970-9657b4a7ed6d',59,NULL,NULL,NULL,N'<p><span>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</span></p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (14,1071,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (15,1071,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (16,1071,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',58,NULL,NULL,N'The second article',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (17,1071,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',59,NULL,NULL,NULL,N'<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (18,1072,'3108d580-3b93-45de-9cc9-3a355ddab406',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (19,1072,'3108d580-3b93-45de-9cc9-3a355ddab406',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (20,1072,'3108d580-3b93-45de-9cc9-3a355ddab406',60,NULL,NULL,N'This page contains the projects',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (21,1072,'3108d580-3b93-45de-9cc9-3a355ddab406',61,NULL,NULL,NULL,N'');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (22,1072,'957dc3a6-cff6-4aa0-a133-6c83c6110697',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (23,1072,'957dc3a6-cff6-4aa0-a133-6c83c6110697',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (24,1072,'957dc3a6-cff6-4aa0-a133-6c83c6110697',60,NULL,NULL,N'This page contains the projects',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (25,1072,'957dc3a6-cff6-4aa0-a133-6c83c6110697',61,NULL,NULL,NULL,N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (26,1073,'c2a339af-26d8-4a89-b7c0-57c49200b501',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (27,1073,'c2a339af-26d8-4a89-b7c0-57c49200b501',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (28,1073,'c2a339af-26d8-4a89-b7c0-57c49200b501',62,NULL,NULL,N'The first project',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (29,1073,'c2a339af-26d8-4a89-b7c0-57c49200b501',63,NULL,NULL,NULL,N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (30,1073,'c2a339af-26d8-4a89-b7c0-57c49200b501',64,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (31,1074,'c82b9668-a130-44ce-b122-94c92387ce77',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (32,1074,'c82b9668-a130-44ce-b122-94c92387ce77',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (33,1074,'c82b9668-a130-44ce-b122-94c92387ce77',62,NULL,NULL,N'The second project',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (34,1074,'c82b9668-a130-44ce-b122-94c92387ce77',63,NULL,NULL,NULL,N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (35,1074,'c82b9668-a130-44ce-b122-94c92387ce77',64,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (36,1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (37,1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (38,1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',62,NULL,NULL,N'The first project',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (39,1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',63,NULL,NULL,NULL,N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (40,1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',64,NULL,NULL,N'6',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (41,1074,'bff73feb-941e-4faa-8e0e-31538337111c',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (42,1074,'bff73feb-941e-4faa-8e0e-31538337111c',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (43,1074,'bff73feb-941e-4faa-8e0e-31538337111c',62,NULL,NULL,N'The second project',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (44,1074,'bff73feb-941e-4faa-8e0e-31538337111c',63,NULL,NULL,NULL,N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (45,1074,'bff73feb-941e-4faa-8e0e-31538337111c',64,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (46,1078,'d2973020-f4ad-4194-bc25-da40e6cd52ac',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (47,1078,'d2973020-f4ad-4194-bc25-da40e6cd52ac',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (48,1078,'d2973020-f4ad-4194-bc25-da40e6cd52ac',65,NULL,NULL,NULL,N'{
  "name": "Info page normal",
  "sections": [
    {
      "grid": 12,
      "rows": []
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (49,1079,'5cf9abcb-d416-4852-a65c-e5563e7a3abb',6,NULL,NULL,N'/media/1001/design1.png',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (50,1079,'5cf9abcb-d416-4852-a65c-e5563e7a3abb',7,NULL,NULL,N'960',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (51,1079,'5cf9abcb-d416-4852-a65c-e5563e7a3abb',8,NULL,NULL,N'295',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (52,1079,'5cf9abcb-d416-4852-a65c-e5563e7a3abb',9,NULL,NULL,N'136400',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (53,1079,'5cf9abcb-d416-4852-a65c-e5563e7a3abb',10,NULL,NULL,N'png',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (54,1078,'60465c95-4f1f-40e8-ab98-9d1f26374ded',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (55,1078,'60465c95-4f1f-40e8-ab98-9d1f26374ded',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (56,1078,'60465c95-4f1f-40e8-ab98-9d1f26374ded',65,NULL,NULL,NULL,N'{
  "name": "Info page normal",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "columns layout",
          "areas": [
            {
              "grid": 12,
              "controls": [
                {
                  "value": "Website headline",
                  "editor": {
                    "name": "Headline",
                    "alias": "headline",
                    "view": "textstring",
                    "render": null,
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold",
                      "markup": "<h1>#value#</h1>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1079,
                    "image": "/media/1001/design1.png"
                  },
                  "editor": {
                    "name": "Image",
                    "alias": "media",
                    "view": "media",
                    "render": null,
                    "icon": "icon-picture",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": "<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            }
          ],
          "id": "bb999fc5-b842-6450-2d11-1ee77da8f6b0"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (57,1078,'d7412d0b-2d8f-485e-bd20-b842c363b156',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (58,1078,'d7412d0b-2d8f-485e-bd20-b842c363b156',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (59,1078,'d7412d0b-2d8f-485e-bd20-b842c363b156',65,NULL,NULL,NULL,N'{
  "name": "Info page normal",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "columns layout",
          "areas": [
            {
              "grid": 12,
              "controls": [
                {
                  "value": "Aarhus web developer consortium",
                  "editor": {
                    "name": "Headline",
                    "alias": "headline",
                    "view": "textstring",
                    "render": null,
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold",
                      "markup": "<h1>#value#</h1>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1079,
                    "image": "/media/1001/design1.png"
                  },
                  "editor": {
                    "name": "Image",
                    "alias": "media",
                    "view": "media",
                    "render": null,
                    "icon": "icon-picture",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": "<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            }
          ],
          "id": "bb999fc5-b842-6450-2d11-1ee77da8f6b0"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (60,1065,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (61,1065,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',50,NULL,NULL,NULL,N'Aarhus Web Developer');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (62,1065,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',51,NULL,NULL,NULL,N'Aarhus Web Developer');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (63,1065,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',66,NULL,NULL,N'Copyright Aarhus web developer',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (64,1065,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',52,NULL,NULL,N'Aarhus Web Developer',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (65,1065,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',53,NULL,NULL,NULL,N'<p>Welcome to Aarhus Web Developer Coop</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (66,1072,'957dc3a6-cff6-4aa0-a133-6c83c6110697',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (67,1080,'633c1bdd-0209-433e-8095-207e66469e5c',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (68,1080,'633c1bdd-0209-433e-8095-207e66469e5c',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (69,1080,'633c1bdd-0209-433e-8095-207e66469e5c',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (70,1080,'633c1bdd-0209-433e-8095-207e66469e5c',62,NULL,NULL,N'I''m completed',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (71,1080,'633c1bdd-0209-433e-8095-207e66469e5c',63,NULL,NULL,NULL,N'');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (72,1080,'633c1bdd-0209-433e-8095-207e66469e5c',64,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (73,1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (74,1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (75,1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (76,1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (77,1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',62,NULL,NULL,N'I''m completed!',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (78,1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',63,NULL,NULL,NULL,N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (79,1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',64,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (80,1080,'6daab411-4b60-4018-bae9-8491e3511d13',50,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (81,1080,'6daab411-4b60-4018-bae9-8491e3511d13',51,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (82,1080,'6daab411-4b60-4018-bae9-8491e3511d13',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (83,1080,'6daab411-4b60-4018-bae9-8491e3511d13',62,NULL,NULL,N'I''m completed!',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (84,1080,'6daab411-4b60-4018-bae9-8491e3511d13',63,NULL,NULL,NULL,N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (85,1080,'6daab411-4b60-4018-bae9-8491e3511d13',64,NULL,NULL,N'9',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (86,1069,'ab636d17-4ff4-4952-9c79-a928eb315e3e',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (87,1070,'7184308e-79bd-463a-8970-9657b4a7ed6d',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (88,1071,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (89,1074,'bff73feb-941e-4faa-8e0e-31538337111c',66,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (90,1078,'d7412d0b-2d8f-485e-bd20-b842c363b156',66,NULL,NULL,NULL,NULL);
GO
SET IDENTITY_INSERT [cmsPropertyData] OFF;
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1065,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',{ts '2015-09-15 09:06:29.857'},N'<HomePage id="1065" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2015-09-08T08:50:18" updateDate="2015-09-15T09:06:29" nodeName="Web Coop Home" urlName="web-coop-home" path="-1,1065" isDoc="" nodeType="1052" creatorName="Valerio" writerName="Valerio" writerID="0" template="1051" nodeTypeAlias="HomePage">
  <metaDescription><![CDATA[Aarhus Web Developer]]></metaDescription>
  <metaKeywords><![CDATA[Aarhus Web Developer]]></metaKeywords>
  <footerText><![CDATA[Copyright Aarhus web developer]]></footerText>
  <siteTitle><![CDATA[Aarhus Web Developer]]></siteTitle>
  <mainContent><![CDATA[<p>Welcome to Aarhus Web Developer Coop</p>]]></mainContent>
</HomePage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1065,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',{ts '2015-09-08 09:55:35.457'},N'<HomePage id="1065" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2015-09-08T08:50:18" updateDate="2015-09-08T08:50:18" nodeName="Web Coop Home" urlName="web-coop-home" path="-1,1065" isDoc="" nodeType="1052" creatorName="Valerio" writerName="Valerio" writerID="0" template="1051" nodeTypeAlias="HomePage">
  <metaDescription><![CDATA[Aarhus Web Developer]]></metaDescription>
  <metaKeywords><![CDATA[Aarhus Web Developer]]></metaKeywords>
  <siteTitle><![CDATA[Aarhus Web Developer]]></siteTitle>
  <mainContent><![CDATA[<p>Welcome to Aarhus Web Developer Coop</p>]]></mainContent>
  <footerText><![CDATA[Copyright Aarhus Web Developer]]></footerText>
</HomePage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1069,'ab636d17-4ff4-4952-9c79-a928eb315e3e',{ts '2015-09-11 10:47:29.217'},N'<ArticleMain id="1069" parentID="1065" level="2" creatorID="0" sortOrder="0" createDate="2015-09-11T09:40:52" updateDate="2015-09-11T10:47:29" nodeName="Articles" urlName="articles" path="-1,1065,1069" isDoc="" nodeType="1056" creatorName="Valerio" writerName="Valerio" writerID="0" template="1055" nodeTypeAlias="ArticleMain">
  <articlesTitle><![CDATA[This page contains the articles.]]></articlesTitle>
  <articlesBodyText><![CDATA[<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>]]></articlesBodyText>
</ArticleMain>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1070,'7184308e-79bd-463a-8970-9657b4a7ed6d',{ts '2015-09-11 11:02:09.503'},N'<ArticleItem id="1070" parentID="1069" level="3" creatorID="0" sortOrder="0" createDate="2015-09-11T09:42:27" updateDate="2015-09-11T11:02:09" nodeName="The first article" urlName="the-first-article" path="-1,1065,1069,1070" isDoc="" nodeType="1058" creatorName="Valerio" writerName="Valerio" writerID="0" template="1057" nodeTypeAlias="ArticleItem">
  <articleTitle><![CDATA[The first article]]></articleTitle>
  <articleContents><![CDATA[<p><span>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</span></p>]]></articleContents>
</ArticleItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1071,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',{ts '2015-09-11 09:44:07.560'},N'<ArticleItem id="1071" parentID="1069" level="3" creatorID="0" sortOrder="1" createDate="2015-09-11T09:43:01" updateDate="2015-09-11T09:44:07" nodeName="The second article" urlName="the-second-article" path="-1,1065,1069,1071" isDoc="" nodeType="1058" creatorName="Valerio" writerName="Valerio" writerID="0" template="1057" nodeTypeAlias="ArticleItem">
  <articleTitle><![CDATA[The second article]]></articleTitle>
  <articleContents><![CDATA[<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>]]></articleContents>
</ArticleItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1072,'3108d580-3b93-45de-9cc9-3a355ddab406',{ts '2015-09-11 10:47:09.797'},N'<ProjectsMain id="1072" parentID="1065" level="2" creatorID="0" sortOrder="1" createDate="2015-09-11T10:47:09" updateDate="2015-09-11T10:47:09" nodeName="Projects" urlName="projects" path="-1,1065,1072" isDoc="" nodeType="1060" creatorName="Valerio" writerName="Valerio" writerID="0" template="1059" nodeTypeAlias="ProjectsMain">
  <projectsTitle><![CDATA[This page contains the projects]]></projectsTitle>
</ProjectsMain>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1072,'957dc3a6-cff6-4aa0-a133-6c83c6110697',{ts '2015-09-11 10:47:36.703'},N'<ProjectsMain id="1072" parentID="1065" level="2" creatorID="0" sortOrder="1" createDate="2015-09-11T10:47:09" updateDate="2015-09-11T10:47:36" nodeName="Projects" urlName="projects" path="-1,1065,1072" isDoc="" nodeType="1060" creatorName="Valerio" writerName="Valerio" writerID="0" template="1059" nodeTypeAlias="ProjectsMain">
  <projectsTitle><![CDATA[This page contains the projects]]></projectsTitle>
  <projectsBodyText><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectsBodyText>
</ProjectsMain>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',{ts '2015-09-13 17:01:07.173'},N'<ProjectItem id="1073" parentID="1072" level="3" creatorID="0" sortOrder="0" createDate="2015-09-11T10:48:10" updateDate="2015-09-13T17:01:07" nodeName="The first project" urlName="the-first-project" path="-1,1065,1072,1073" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[The first project]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
  <status><![CDATA[Idea]]></status>
</ProjectItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1073,'c2a339af-26d8-4a89-b7c0-57c49200b501',{ts '2015-09-11 10:48:10.543'},N'<ProjectItem id="1073" parentID="1072" level="3" creatorID="0" sortOrder="0" createDate="2015-09-11T10:48:10" updateDate="2015-09-11T10:48:10" nodeName="The first project" urlName="the-first-project" path="-1,1065,1072,1073" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[The first project]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
</ProjectItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1074,'bff73feb-941e-4faa-8e0e-31538337111c',{ts '2015-09-11 10:52:52.260'},N'<ProjectItem id="1074" parentID="1072" level="3" creatorID="0" sortOrder="1" createDate="2015-09-11T10:48:33" updateDate="2015-09-11T10:52:52" nodeName="The second project" urlName="the-second-project" path="-1,1065,1072,1074" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[The second project]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
  <status><![CDATA[Initiated]]></status>
</ProjectItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1074,'c82b9668-a130-44ce-b122-94c92387ce77',{ts '2015-09-11 10:49:14.073'},N'<ProjectItem id="1074" parentID="1072" level="3" creatorID="0" sortOrder="1" createDate="2015-09-11T10:48:33" updateDate="2015-09-11T10:49:14" nodeName="The second project" urlName="the-second-project" path="-1,1065,1072,1074" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[The second project]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
</ProjectItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1078,'60465c95-4f1f-40e8-ab98-9d1f26374ded',{ts '2015-09-13 14:36:18.333'},N'<GridInfoPage id="1078" parentID="1065" level="2" creatorID="0" sortOrder="2" createDate="2015-09-13T14:25:14" updateDate="2015-09-13T14:36:18" nodeName="About Us" urlName="about-us" path="-1,1065,1078" isDoc="" nodeType="1077" creatorName="Valerio" writerName="Valerio" writerID="0" template="1076" nodeTypeAlias="GridInfoPage">
  <gridInfoPage><![CDATA[{
  "name": "Info page normal",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "columns layout",
          "areas": [
            {
              "grid": 12,
              "controls": [
                {
                  "value": "Website headline",
                  "editor": {
                    "name": "Headline",
                    "alias": "headline",
                    "view": "textstring",
                    "render": null,
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold",
                      "markup": "<h1>#value#</h1>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1079,
                    "image": "/media/1001/design1.png"
                  },
                  "editor": {
                    "name": "Image",
                    "alias": "media",
                    "view": "media",
                    "render": null,
                    "icon": "icon-picture",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": "<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            }
          ],
          "id": "bb999fc5-b842-6450-2d11-1ee77da8f6b0"
        }
      ]
    }
  ]
}]]></gridInfoPage>
</GridInfoPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1078,'d7412d0b-2d8f-485e-bd20-b842c363b156',{ts '2015-09-13 14:45:31.047'},N'<GridInfoPage id="1078" parentID="1065" level="2" creatorID="0" sortOrder="2" createDate="2015-09-13T14:25:14" updateDate="2015-09-13T14:45:28" nodeName="About Us" urlName="about-us" path="-1,1065,1078" isDoc="" nodeType="1077" creatorName="Valerio" writerName="Valerio" writerID="0" template="1076" nodeTypeAlias="GridInfoPage">
  <gridInfoPage><![CDATA[{
  "name": "Info page normal",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "columns layout",
          "areas": [
            {
              "grid": 12,
              "controls": [
                {
                  "value": "Aarhus web developer consortium",
                  "editor": {
                    "name": "Headline",
                    "alias": "headline",
                    "view": "textstring",
                    "render": null,
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold",
                      "markup": "<h1>#value#</h1>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1079,
                    "image": "/media/1001/design1.png"
                  },
                  "editor": {
                    "name": "Image",
                    "alias": "media",
                    "view": "media",
                    "render": null,
                    "icon": "icon-picture",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": "<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            }
          ],
          "id": "bb999fc5-b842-6450-2d11-1ee77da8f6b0"
        }
      ]
    }
  ]
}]]></gridInfoPage>
</GridInfoPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1078,'d2973020-f4ad-4194-bc25-da40e6cd52ac',{ts '2015-09-13 14:25:54.207'},N'<GridInfoPage id="1078" parentID="1065" level="2" creatorID="0" sortOrder="2" createDate="2015-09-13T14:25:14" updateDate="2015-09-13T14:25:14" nodeName="About Us" urlName="about-us" path="-1,1065,1078" isDoc="" nodeType="1077" creatorName="Valerio" writerName="Valerio" writerID="0" template="1076" nodeTypeAlias="GridInfoPage">
  <gridInfoPage><![CDATA[{
  "name": "Info page normal",
  "sections": [
    {
      "grid": 12,
      "rows": []
    }
  ]
}]]></gridInfoPage>
</GridInfoPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',{ts '2015-09-13 17:01:17.540'},N'<ProjectItem id="1080" parentID="1072" level="3" creatorID="0" sortOrder="2" createDate="2015-09-13T17:00:49" updateDate="2015-09-13T17:01:17" nodeName="The first completed project" urlName="the-first-completed-project" path="-1,1065,1072,1080" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[I''m completed!]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
</ProjectItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1080,'633c1bdd-0209-433e-8095-207e66469e5c',{ts '2015-09-13 17:00:49.860'},N'<ProjectItem id="1080" parentID="1072" level="3" creatorID="0" sortOrder="2" createDate="2015-09-13T17:00:49" updateDate="2015-09-13T17:00:49" nodeName="The first completed project" urlName="the-first-completed-project" path="-1,1065,1072,1080" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[I''m completed]]></projectTitle>
</ProjectItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1080,'6daab411-4b60-4018-bae9-8491e3511d13',{ts '2015-09-13 17:02:16.673'},N'<ProjectItem id="1080" parentID="1072" level="3" creatorID="0" sortOrder="2" createDate="2015-09-13T17:00:49" updateDate="2015-09-13T17:02:16" nodeName="The first completed project" urlName="the-first-completed-project" path="-1,1065,1072,1080" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[I''m completed!]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
  <status><![CDATA[Completed]]></status>
</ProjectItem>');
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] ON;
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (1,0,0,N'listArticles',N'listArticles',N'',N'',N'',0,0,1,N'~/Views/MacroPartials/listArticles.cshtml');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (2,0,0,N'listProjects',N'listProjects',N'',N'',N'',0,0,1,N'~/Views/MacroPartials/listProjects.cshtml');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (4,0,0,N'mainMenu',N'mainMenu',N'',N'',N'',0,0,1,N'~/Views/MacroPartials/mainMenu.cshtml');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (7,0,0,N'mainNav',N'mainNav',N'',N'',N'',0,0,1,N'~/Views/MacroPartials/mainNav.cshtml');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (9,0,0,N'recentProjectsTwo',N'recentProjectsTwo',N'',N'',N'',0,0,1,N'~/Views/MacroPartials/recentProjectsTwo.cshtml');
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1052,1051,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1054,1053,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1056,1055,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1058,1057,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1060,1059,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1062,1061,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1068,1067,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1077,1076,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1073,1,0,'96df6b19-5247-4f07-88e0-054c1a95cc53',N'The first project',NULL,NULL,{ts '2015-09-13 17:01:07.153'},1061,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1080,0,0,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',N'The first completed project',NULL,NULL,{ts '2015-09-13 17:01:17.527'},1061,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1080,0,0,'633c1bdd-0209-433e-8095-207e66469e5c',N'The first completed project',NULL,NULL,{ts '2015-09-13 17:00:49.827'},1061,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1074,1,0,'bff73feb-941e-4faa-8e0e-31538337111c',N'The second project',NULL,NULL,{ts '2015-09-11 10:52:52.233'},1061,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1072,0,0,'3108d580-3b93-45de-9cc9-3a355ddab406',N'Projects',NULL,NULL,{ts '2015-09-11 10:47:09.770'},1059,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1073,0,0,'c2a339af-26d8-4a89-b7c0-57c49200b501',N'The first project',NULL,NULL,{ts '2015-09-11 10:48:10.517'},1061,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1065,1,0,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',N'Web Coop Home',NULL,NULL,{ts '2015-09-15 09:06:29.830'},1051,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1072,1,0,'957dc3a6-cff6-4aa0-a133-6c83c6110697',N'Projects',NULL,NULL,{ts '2015-09-11 10:47:36.677'},1059,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1080,1,0,'6daab411-4b60-4018-bae9-8491e3511d13',N'The first completed project',NULL,NULL,{ts '2015-09-13 17:02:16.657'},1061,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1074,0,0,'c82b9668-a130-44ce-b122-94c92387ce77',N'The second project',NULL,NULL,{ts '2015-09-11 10:49:14.057'},1061,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1070,1,0,'7184308e-79bd-463a-8970-9657b4a7ed6d',N'The first article',NULL,NULL,{ts '2015-09-11 11:02:09.470'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1078,0,0,'60465c95-4f1f-40e8-ab98-9d1f26374ded',N'About Us',NULL,NULL,{ts '2015-09-13 14:36:18.313'},1076,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1069,1,0,'ab636d17-4ff4-4952-9c79-a928eb315e3e',N'Articles',NULL,NULL,{ts '2015-09-11 10:47:29.193'},1055,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1078,1,0,'d7412d0b-2d8f-485e-bd20-b842c363b156',N'About Us',NULL,NULL,{ts '2015-09-13 14:45:28.593'},1076,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1071,1,0,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',N'The second article',NULL,NULL,{ts '2015-09-11 09:44:07.527'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1065,0,0,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',N'Web Coop Home',NULL,NULL,{ts '2015-09-08 08:50:18.763'},1051,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1078,0,0,'d2973020-f4ad-4194-bc25-da40e6cd52ac',N'About Us',NULL,NULL,{ts '2015-09-13 14:25:14.373'},1076,0);
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] ON;
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-4,-97,N'[{"alias":"email","isSystem":1},{"alias":"username","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]',4,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-3,-97,N'asc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-2,-97,N'Name',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-1,-97,N'10',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (3,-87,N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|',0,N'');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (4,1041,N'default',0,N'group');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (5,1045,N'1',0,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (6,1064,N'Idea',1,N'0');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (7,1064,N'Initiated',2,N'1');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (8,1064,N'Underdevelopment',3,N'2');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (9,1064,N'Completed',4,N'3');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (12,1075,N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})"
    }
  ],
  "config": [
    {
      "label": "Class",
      "description": "Set a css class",
      "key": "class",
      "view": "textstring"
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "Info page normal",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "1 and 3 column page",
      "areas": [
        {
          "grid": 12
        },
        {
          "grid": 12
        },
        {
          "grid": 12
        },
        {
          "grid": 4
        },
        {
          "grid": 4
        },
        {
          "grid": 4
        }
      ]
    },
    {
      "name": "columns layout",
      "areas": [
        {
          "grid": 12
        },
        {
          "grid": 12
        },
        {
          "grid": 12
        },
        {
          "grid": 4
        },
        {
          "grid": 4
        },
        {
          "grid": 4
        },
        {
          "grid": 0
        }
      ]
    }
  ]
}',1,N'items');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (13,1075,N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',2,N'rte');
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] OFF;
GO
SET IDENTITY_INSERT [cmsDataType] ON;
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-28,-97,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-27,-96,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-26,-95,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (1,-49,N'Umbraco.TrueFalse',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (2,-51,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (3,-87,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (4,-88,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (5,-89,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (6,-90,N'Umbraco.UploadField',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (7,-92,N'Umbraco.NoEdit',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (8,-36,N'Umbraco.DateTime',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (9,-37,N'Umbraco.ColorPickerAlias',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (10,-38,N'Umbraco.FolderBrowser',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (11,-39,N'Umbraco.DropDownMultiple',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (12,-40,N'Umbraco.RadioButtonList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (13,-41,N'Umbraco.Date',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (14,-42,N'Umbraco.DropDown',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (15,-43,N'Umbraco.CheckBoxList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (16,1034,N'Umbraco.ContentPickerAlias',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (17,1035,N'Umbraco.MediaPicker',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (18,1036,N'Umbraco.MemberPicker',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (21,1040,N'Umbraco.RelatedLinks',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (22,1041,N'Umbraco.Tags',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (24,1043,N'Umbraco.ImageCropper',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (25,1045,N'Umbraco.MultipleMediaPicker',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (30,1064,N'Umbraco.DropDown',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (31,1075,N'Umbraco.Grid',N'Ntext');
GO
SET IDENTITY_INSERT [cmsDataType] OFF;
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1065,N'<HomePage id="1065" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2015-09-08T08:50:18" updateDate="2015-09-15T09:06:29" nodeName="Web Coop Home" urlName="web-coop-home" path="-1,1065" isDoc="" nodeType="1052" creatorName="Valerio" writerName="Valerio" writerID="0" template="1051" nodeTypeAlias="HomePage">
  <metaDescription><![CDATA[Aarhus Web Developer]]></metaDescription>
  <metaKeywords><![CDATA[Aarhus Web Developer]]></metaKeywords>
  <footerText><![CDATA[Copyright Aarhus web developer]]></footerText>
  <siteTitle><![CDATA[Aarhus Web Developer]]></siteTitle>
  <mainContent><![CDATA[<p>Welcome to Aarhus Web Developer Coop</p>]]></mainContent>
</HomePage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1069,N'<ArticleMain id="1069" parentID="1065" level="2" creatorID="0" sortOrder="0" createDate="2015-09-11T09:40:52" updateDate="2015-09-11T10:47:29" nodeName="Articles" urlName="articles" path="-1,1065,1069" isDoc="" nodeType="1056" creatorName="Valerio" writerName="Valerio" writerID="0" template="1055" nodeTypeAlias="ArticleMain">
  <articlesTitle><![CDATA[This page contains the articles.]]></articlesTitle>
  <articlesBodyText><![CDATA[<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>]]></articlesBodyText>
</ArticleMain>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1070,N'<ArticleItem id="1070" parentID="1069" level="3" creatorID="0" sortOrder="0" createDate="2015-09-11T09:42:27" updateDate="2015-09-11T11:02:09" nodeName="The first article" urlName="the-first-article" path="-1,1065,1069,1070" isDoc="" nodeType="1058" creatorName="Valerio" writerName="Valerio" writerID="0" template="1057" nodeTypeAlias="ArticleItem">
  <articleTitle><![CDATA[The first article]]></articleTitle>
  <articleContents><![CDATA[<p><span>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</span></p>]]></articleContents>
</ArticleItem>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1071,N'<ArticleItem id="1071" parentID="1069" level="3" creatorID="0" sortOrder="1" createDate="2015-09-11T09:43:01" updateDate="2015-09-11T09:44:07" nodeName="The second article" urlName="the-second-article" path="-1,1065,1069,1071" isDoc="" nodeType="1058" creatorName="Valerio" writerName="Valerio" writerID="0" template="1057" nodeTypeAlias="ArticleItem">
  <articleTitle><![CDATA[The second article]]></articleTitle>
  <articleContents><![CDATA[<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>]]></articleContents>
</ArticleItem>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1072,N'<ProjectsMain id="1072" parentID="1065" level="2" creatorID="0" sortOrder="1" createDate="2015-09-11T10:47:09" updateDate="2015-09-11T10:47:36" nodeName="Projects" urlName="projects" path="-1,1065,1072" isDoc="" nodeType="1060" creatorName="Valerio" writerName="Valerio" writerID="0" template="1059" nodeTypeAlias="ProjectsMain">
  <projectsTitle><![CDATA[This page contains the projects]]></projectsTitle>
  <projectsBodyText><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectsBodyText>
</ProjectsMain>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1073,N'<ProjectItem id="1073" parentID="1072" level="3" creatorID="0" sortOrder="0" createDate="2015-09-11T10:48:10" updateDate="2015-09-13T17:01:07" nodeName="The first project" urlName="the-first-project" path="-1,1065,1072,1073" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[The first project]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
  <status><![CDATA[Idea]]></status>
</ProjectItem>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1074,N'<ProjectItem id="1074" parentID="1072" level="3" creatorID="0" sortOrder="1" createDate="2015-09-11T10:48:33" updateDate="2015-09-11T10:52:52" nodeName="The second project" urlName="the-second-project" path="-1,1065,1072,1074" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[The second project]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
  <status><![CDATA[Initiated]]></status>
</ProjectItem>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1078,N'<GridInfoPage id="1078" parentID="1065" level="2" creatorID="0" sortOrder="2" createDate="2015-09-13T14:25:14" updateDate="2015-09-13T14:45:28" nodeName="About Us" urlName="about-us" path="-1,1065,1078" isDoc="" nodeType="1077" creatorName="Valerio" writerName="Valerio" writerID="0" template="1076" nodeTypeAlias="GridInfoPage">
  <gridInfoPage><![CDATA[{
  "name": "Info page normal",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "columns layout",
          "areas": [
            {
              "grid": 12,
              "controls": [
                {
                  "value": "Aarhus web developer consortium",
                  "editor": {
                    "name": "Headline",
                    "alias": "headline",
                    "view": "textstring",
                    "render": null,
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold",
                      "markup": "<h1>#value#</h1>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1079,
                    "image": "/media/1001/design1.png"
                  },
                  "editor": {
                    "name": "Image",
                    "alias": "media",
                    "view": "media",
                    "render": null,
                    "icon": "icon-picture",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 12,
              "controls": [
                {
                  "value": "<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            },
            {
              "grid": 4,
              "controls": [
                {
                  "value": "<p><span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  }
                }
              ]
            }
          ],
          "id": "bb999fc5-b842-6450-2d11-1ee77da8f6b0"
        }
      ]
    }
  ]
}]]></gridInfoPage>
</GridInfoPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1079,N'<Image id="1079" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2015-09-13T14:33:50" updateDate="2015-09-13T14:33:50" nodeName="design1.png" urlName="design1png" path="-1,1079" isDoc="" nodeType="1032" writerName="Valerio" writerID="0" version="5cf9abcb-d416-4852-a65c-e5563e7a3abb" template="0" nodeTypeAlias="Image">
  <umbracoFile><![CDATA[/media/1001/design1.png]]></umbracoFile>
  <umbracoWidth><![CDATA[960]]></umbracoWidth>
  <umbracoHeight><![CDATA[295]]></umbracoHeight>
  <umbracoBytes><![CDATA[136400]]></umbracoBytes>
  <umbracoExtension><![CDATA[png]]></umbracoExtension>
</Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1080,N'<ProjectItem id="1080" parentID="1072" level="3" creatorID="0" sortOrder="2" createDate="2015-09-13T17:00:49" updateDate="2015-09-13T17:02:16" nodeName="The first completed project" urlName="the-first-completed-project" path="-1,1065,1072,1080" isDoc="" nodeType="1062" creatorName="Valerio" writerName="Valerio" writerID="0" template="1061" nodeTypeAlias="ProjectItem">
  <projectTitle><![CDATA[I''m completed!]]></projectTitle>
  <projectContents><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>]]></projectContents>
  <status><![CDATA[Completed]]></status>
</ProjectItem>');
GO
SET IDENTITY_INSERT [cmsContentVersion] ON;
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (1,1065,'e50921e7-c49a-4874-a6fe-cff2d1eaa585',{ts '2015-09-08 08:50:18.763'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (2,1069,'ab636d17-4ff4-4952-9c79-a928eb315e3e',{ts '2015-09-11 10:47:29.193'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (3,1070,'7184308e-79bd-463a-8970-9657b4a7ed6d',{ts '2015-09-11 11:02:09.470'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (4,1071,'32a8e1db-672e-46bc-8be4-c9efdf2af6b9',{ts '2015-09-11 09:44:07.527'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (5,1072,'3108d580-3b93-45de-9cc9-3a355ddab406',{ts '2015-09-11 10:47:09.770'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (6,1072,'957dc3a6-cff6-4aa0-a133-6c83c6110697',{ts '2015-09-11 10:47:36.677'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (7,1073,'c2a339af-26d8-4a89-b7c0-57c49200b501',{ts '2015-09-11 10:48:10.517'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (8,1074,'c82b9668-a130-44ce-b122-94c92387ce77',{ts '2015-09-11 10:49:14.057'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (9,1073,'96df6b19-5247-4f07-88e0-054c1a95cc53',{ts '2015-09-13 17:01:07.153'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (10,1074,'bff73feb-941e-4faa-8e0e-31538337111c',{ts '2015-09-11 10:52:52.233'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (11,1078,'d2973020-f4ad-4194-bc25-da40e6cd52ac',{ts '2015-09-13 14:25:14.373'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (12,1079,'5cf9abcb-d416-4852-a65c-e5563e7a3abb',{ts '2015-09-13 14:33:50.390'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (13,1078,'60465c95-4f1f-40e8-ab98-9d1f26374ded',{ts '2015-09-13 14:36:18.313'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (14,1078,'d7412d0b-2d8f-485e-bd20-b842c363b156',{ts '2015-09-13 14:45:28.593'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (15,1065,'98a7ff98-db4c-43dc-9690-6022d8dc1f27',{ts '2015-09-15 09:06:29.830'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (16,1080,'633c1bdd-0209-433e-8095-207e66469e5c',{ts '2015-09-13 17:00:49.827'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (17,1080,'315968b2-b86e-48b6-84b3-1f4f0a1b2f24',{ts '2015-09-13 17:01:17.527'},NULL);
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate],[LanguageLocale]) VALUES (18,1080,'6daab411-4b60-4018-bae9-8491e3511d13',{ts '2015-09-13 17:02:16.657'},NULL);
GO
SET IDENTITY_INSERT [cmsContentVersion] OFF;
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1033,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1050,1054,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1052,1050,8);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1052,1056,6);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1052,1060,9);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1052,1068,5);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1052,1077,7);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1056,1058,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1060,1062,1);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1052);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1054);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1056);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1058);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1060);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1062);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1068);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1050,1077);
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (531,1044,N'Member',N'icon-user',N'icon-user',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (532,1031,N'Folder',N'icon-folder',N'icon-folder',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (533,1032,N'Image',N'icon-picture',N'icon-picture',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (534,1033,N'File',N'icon-document',N'icon-document',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (535,1050,N'Master',N'.sprTreeFolder',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (536,1052,N'HomePage',N'icon-home',N'folder.png',N'',0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (537,1054,N'TextPage',N'.sprTreeFolder',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (538,1056,N'ArticleMain',N'icon-folder color-blue',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (539,1058,N'ArticleItem',N'icon-umb-content color-blue',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (540,1060,N'ProjectsMain',N'icon-folder color-red',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (541,1062,N'ProjectItem',N'icon-document color-red',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (543,1068,N'About',N'.sprTreeFolder',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (544,1077,N'GridInfoPage',N'icon-info',N'folder.png',N'',0,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
SET IDENTITY_INSERT [cmsContent] ON;
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (1,1065,1052);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (2,1069,1056);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (3,1070,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (4,1071,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (5,1072,1060);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (6,1073,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (7,1074,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (8,1078,1077);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (9,1079,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (10,1080,1062);
GO
SET IDENTITY_INSERT [cmsContent] OFF;
GO
ALTER TABLE [umbracoUserType] ADD CONSTRAINT [PK_umbracoUserType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [PK_user2app] PRIMARY KEY ([user],[app]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_structure] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY ([userId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [PK_umbracoDomains] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsTaskType] ADD CONSTRAINT [PK_cmsTaskType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [PK_cmsTask] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsStylesheetProperty] ADD CONSTRAINT [PK_cmsStylesheetProperty] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsStylesheet] ADD CONSTRAINT [PK_cmsStylesheet] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[propertyTypeId],[tagId]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPreviewXml] ADD CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY ([nodeId],[versionId]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [PK_cmsDocument] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDataTypePreValues] ADD CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [PK_cmsDataType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentXml] ADD CONSTRAINT [PK_cmsContentXml] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [PK_cmsContent] PRIMARY KEY ([pk]);
GO
CREATE INDEX [IX_umbracoUserLogins_Index] ON [umbracoUserLogins] ([contextID] ASC);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
CREATE UNIQUE INDEX [IX_computerName] ON [umbracoServer] ([computerName] ASC);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
CREATE INDEX [IX_umbracoNodeObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNodeParentId] ON [umbracoNode] ([parentID] ASC);
GO
CREATE INDEX [IX_umbracoNodeTrashed] ON [umbracoNode] ([trashed] ASC);
GO
CREATE INDEX [IX_umbracoNodeUniqueID] ON [umbracoNode] ([uniqueID] ASC);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoLanguage_languageISOCode] ON [umbracoLanguage] ([languageISOCode] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsTemplate_nodeId] ON [cmsTemplate] ([nodeId] ASC);
GO
CREATE INDEX [IX_cmsTaskType_alias] ON [cmsTaskType] ([alias] ASC);
GO
CREATE INDEX [IX_cmsTags] ON [cmsTags] ([tag] ASC,[group] ASC);
GO
CREATE INDEX [IX_cmsPropertyData] ON [cmsPropertyData] ([id] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_1] ON [cmsPropertyData] ([contentNodeId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_2] ON [cmsPropertyData] ([versionId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_3] ON [cmsPropertyData] ([propertytypeid] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroPropertyAlias] ON [cmsMacro] ([macroAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroProperty_Alias] ON [cmsMacroProperty] ([macro] ASC,[macroPropertyAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDocument] ON [cmsDocument] ([nodeId] ASC,[versionId] ASC);
GO
CREATE INDEX [IX_cmsDocument_newest] ON [cmsDocument] ([newest] ASC);
GO
CREATE INDEX [IX_cmsDocument_published] ON [cmsDocument] ([published] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDictionary_id] ON [cmsDictionary] ([id] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDataType_nodeId] ON [cmsDataType] ([nodeId] ASC);
GO
CREATE INDEX [IX_cmsContentVersion_ContentId] ON [cmsContentVersion] ([ContentId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentVersion_VersionId] ON [cmsContentVersion] ([VersionId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentType] ON [cmsContentType] ([nodeId] ASC);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContent] ON [cmsContent] ([nodeId] ASC);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY ([userType]) REFERENCES [umbracoUserType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY ([user]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_cmsTemplate] FOREIGN KEY ([master]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY ([taskTypeId]) REFERENCES [cmsTaskType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY ([parentUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY ([ParentId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsStylesheet] ADD CONSTRAINT [FK_cmsStylesheet_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id] FOREIGN KEY ([parentGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertytypeid]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY ([contentNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

