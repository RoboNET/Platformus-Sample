USE [master]
GO
/****** Object:  Database [Platformus]    Script Date: 10.01.2017 12:20:46 ******/
CREATE DATABASE [Platformus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Platformus', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Platformus.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Platformus_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Platformus_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Platformus] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Platformus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Platformus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Platformus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Platformus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Platformus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Platformus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Platformus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Platformus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Platformus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Platformus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Platformus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Platformus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Platformus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Platformus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Platformus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Platformus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Platformus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Platformus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Platformus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Platformus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Platformus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Platformus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Platformus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Platformus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Platformus] SET  MULTI_USER 
GO
ALTER DATABASE [Platformus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Platformus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Platformus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Platformus] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Platformus]
GO
/****** Object:  User [platformus]    Script Date: 10.01.2017 12:20:46 ******/
CREATE USER [platformus] FOR LOGIN [platformus] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [platformus]
GO
/****** Object:  Table [dbo].[CachedForms]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CachedForms](
	[CultureId] [int] NOT NULL,
	[FormId] [int] NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[CachedFields] [nvarchar](max) NULL,
 CONSTRAINT [PK_CachedForms] PRIMARY KEY CLUSTERED 
(
	[CultureId] ASC,
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CachedMenus]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CachedMenus](
	[CultureId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[CachedMenuItems] [nvarchar](max) NULL,
 CONSTRAINT [PK_CachedMenus] PRIMARY KEY CLUSTERED 
(
	[CultureId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CachedObjects]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CachedObjects](
	[CultureId] [int] NOT NULL,
	[ObjectId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[ViewName] [nvarchar](32) NULL,
	[Url] [nvarchar](128) NULL,
	[CachedProperties] [nvarchar](max) NULL,
	[CachedDataSources] [nvarchar](max) NULL,
 CONSTRAINT [PK_CachedObjects] PRIMARY KEY CLUSTERED 
(
	[CultureId] ASC,
	[ObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classes]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[PluralizedName] [nvarchar](64) NOT NULL,
	[IsAbstract] [bit] NULL,
	[IsStandalone] [bit] NULL,
	[DefaultViewName] [nvarchar](32) NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompletedFields]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletedFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompletedFormId] [int] NOT NULL,
	[FieldId] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_CompletedFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompletedForms]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletedForms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NOT NULL,
	[Created] [bigint] NOT NULL,
 CONSTRAINT [PK_CompletedForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Credentials]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credentials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CredentialTypeId] [int] NOT NULL,
	[Identifier] [nvarchar](64) NOT NULL,
	[Secret] [nvarchar](1024) NULL,
 CONSTRAINT [PK_Credentials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CredentialTypes]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_CredentialTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cultures]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cultures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[IsNeutral] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Cultures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataSources]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[CSharpClassName] [nvarchar](128) NOT NULL,
	[Parameters] [nvarchar](1024) NULL,
 CONSTRAINT [PK_DataSources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataTypes]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JavaScriptEditorClassName] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_DataTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dictionaries]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dictionaries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Dictionaries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldOptions]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldOptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldId] [int] NOT NULL,
	[ValueId] [int] NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_FieldOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fields]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NOT NULL,
	[FieldTypeId] [int] NOT NULL,
	[NameId] [int] NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_FieldTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Size] [bigint] NOT NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forms]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[NameId] [int] NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localizations]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localizations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DictionaryId] [int] NOT NULL,
	[CultureId] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Localizations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Members]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[TabId] [int] NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [int] NULL,
	[PropertyDataTypeId] [int] NULL,
	[IsPropertyLocalizable] [bit] NULL,
	[IsPropertyVisibleInList] [bit] NULL,
	[RelationClassId] [int] NULL,
	[IsRelationSingleParent] [bit] NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NULL,
	[MenuItemId] [int] NULL,
	[NameId] [int] NOT NULL,
	[Url] [nvarchar](128) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[NameId] [int] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Objects]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[ViewName] [nvarchar](32) NULL,
	[Url] [nvarchar](128) NULL,
 CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Properties]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ObjectId] [int] NULL,
	[MemberId] [int] NOT NULL,
	[HtmlId] [int] NOT NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relations]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[PrimaryId] [int] NOT NULL,
	[ForeignId] [int] NOT NULL,
 CONSTRAINT [PK_Relations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tabs]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tabs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_Tabs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NULL,
	[Created] [bigint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Variables]    Script Date: 10.01.2017 12:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationId] [int] NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Value] [nvarchar](1024) NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_Variables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CachedForms] ([CultureId], [FormId], [Code], [Name], [CachedFields]) VALUES (1, 5, N'Feedback', N'Feedback', N'[{"FieldId":17,"FieldTypeCode":"TextBox","Name":"Your name","Position":1,"CachedFieldOptions":null},{"FieldId":18,"FieldTypeCode":"TextBox","Name":"Your phone","Position":2,"CachedFieldOptions":null},{"FieldId":19,"FieldTypeCode":"TextArea","Name":"Your message","Position":3,"CachedFieldOptions":null}]')
GO
INSERT [dbo].[CachedForms] ([CultureId], [FormId], [Code], [Name], [CachedFields]) VALUES (2, 5, N'Feedback', N' Зворотний зв’язок', N'[{"FieldId":17,"FieldTypeCode":"TextBox","Name":"Ваше ім’я","Position":1,"CachedFieldOptions":null},{"FieldId":18,"FieldTypeCode":"TextBox","Name":"Ваш телефон","Position":2,"CachedFieldOptions":null},{"FieldId":19,"FieldTypeCode":"TextArea","Name":"Ваше повідомлення","Position":3,"CachedFieldOptions":null}]')
GO
INSERT [dbo].[CachedMenus] ([CultureId], [MenuId], [Code], [CachedMenuItems]) VALUES (1, 6, N'Main', N'[{"MenuItemId":39,"Name":"Home","Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":40,"Name":"Features","Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":41,"Name":"Blog","Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":42,"Name":"Contacts","Url":"/contacts","Position":4,"CachedMenuItems":null}]')
GO
INSERT [dbo].[CachedMenus] ([CultureId], [MenuId], [Code], [CachedMenuItems]) VALUES (2, 6, N'Main', N'[{"MenuItemId":39,"Name":"Головна","Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":40,"Name":"Особливості","Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":41,"Name":"Блог","Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":42,"Name":"Контакти","Url":"/contacts","Position":4,"CachedMenuItems":null}]')
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 1, 1, N'Index', N'/', N'[{"PropertyId":192,"MemberCode":"Content","Html":"<p>This is a demo website running on Platformus CMS.</p>\r\n<p>You can manage it using the <a href=\"/backend/\">backend</a>.</p>\r\n<p>Email: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Password: admin</p>"},{"PropertyId":193,"MemberCode":"Title","Html":"Platformus CMS demo website"},{"PropertyId":194,"MemberCode":"MetaDescription","Html":"CMS, Platformus"},{"PropertyId":195,"MemberCode":"MetaKeywords","Html":"This is a demo website running on Platformus CMS."}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 2, 2, N'Features', N'/features', N'[{"PropertyId":166,"MemberCode":"Content","Html":"<p>The main features of the Platformus CMS:</p>"},{"PropertyId":167,"MemberCode":"Title","Html":"Features"},{"PropertyId":168,"MemberCode":"MetaDescription","Html":""},{"PropertyId":169,"MemberCode":"MetaKeywords","Html":""}]', N'[{"DataSourceId":7,"Code":"Features","CSharpClassName":"Platformus.Domain.DataSources.PrimaryObjectsDataSource","Parameters":null}]')
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 3, 3, N'Contacts', N'/contacts', N'[{"PropertyId":162,"MemberCode":"Content","Html":"<p>Contacts</p>\r\n<p>Website: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":163,"MemberCode":"Title","Html":"Contacts"},{"PropertyId":164,"MemberCode":"MetaDescription","Html":""},{"PropertyId":165,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 4, 5, N'Blog', N'/blog', N'[{"PropertyId":143,"MemberCode":"Content","Html":"<p>Blog</p>\r\n<p>Only related objects demo.</p>"},{"PropertyId":144,"MemberCode":"Title","Html":"Blog"},{"PropertyId":145,"MemberCode":"MetaDescription","Html":""},{"PropertyId":146,"MemberCode":"MetaKeywords","Html":""}]', N'[{"DataSourceId":8,"Code":"BlogPosts","CSharpClassName":"Platformus.Domain.DataSources.ForeignObjectsDataSource","Parameters":null}]')
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 5, 6, N'BlogPost', N'/blog/post-1', N'[{"PropertyId":174,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":175,"MemberCode":"Preview","Html":"Post 1"},{"PropertyId":176,"MemberCode":"Content","Html":"<p>Post 1 content</p>"},{"PropertyId":177,"MemberCode":"Title","Html":"Post 1"},{"PropertyId":178,"MemberCode":"MetaDescription","Html":""},{"PropertyId":179,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 6, 6, N'BlogPost', N'/blog/post-2', N'[{"PropertyId":180,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":181,"MemberCode":"Preview","Html":"Post 2"},{"PropertyId":182,"MemberCode":"Content","Html":"<p>Post&nbsp;2 content</p>"},{"PropertyId":183,"MemberCode":"Title","Html":"Post 2"},{"PropertyId":184,"MemberCode":"MetaDescription","Html":""},{"PropertyId":185,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 7, 6, N'BlogPost', N'/blog/post-3', N'[{"PropertyId":186,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":187,"MemberCode":"Preview","Html":"Post 3"},{"PropertyId":188,"MemberCode":"Content","Html":"<p>Post&nbsp;3 content</p>"},{"PropertyId":189,"MemberCode":"Title","Html":"Post 3"},{"PropertyId":190,"MemberCode":"MetaDescription","Html":""},{"PropertyId":191,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 8, 4, NULL, NULL, N'[{"PropertyId":73,"MemberCode":"Name","Html":"Modular structure"},{"PropertyId":74,"MemberCode":"State","Html":"yes"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 9, 4, NULL, NULL, N'[{"PropertyId":43,"MemberCode":"Name","Html":"User interface localization"},{"PropertyId":44,"MemberCode":"State","Html":"no"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 10, 4, NULL, NULL, N'[{"PropertyId":45,"MemberCode":"Name","Html":"Content localization"},{"PropertyId":46,"MemberCode":"State","Html":"yes"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (1, 11, 4, NULL, NULL, N'[{"PropertyId":47,"MemberCode":"Name","Html":"Flexible content management"},{"PropertyId":48,"MemberCode":"State","Html":"yes"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 1, 1, N'Index', N'/', N'[{"PropertyId":192,"MemberCode":"Content","Html":"<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>\r\n<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href=\"/backend/\">бекенду</a>.</p>\r\n<p>Електронна пошта: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Пароль: admin</p>"},{"PropertyId":193,"MemberCode":"Title","Html":"Демонстраційний веб-сайт на CMS Platformus"},{"PropertyId":194,"MemberCode":"MetaDescription","Html":"CMS, Platformus"},{"PropertyId":195,"MemberCode":"MetaKeywords","Html":"Це демонстраційний веб-сайт, що працює на CMS Platformus."}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 2, 2, N'Features', N'/features', N'[{"PropertyId":166,"MemberCode":"Content","Html":"<p>Основні особливості CMS Platformus:</p>"},{"PropertyId":167,"MemberCode":"Title","Html":"Особливості"},{"PropertyId":168,"MemberCode":"MetaDescription","Html":""},{"PropertyId":169,"MemberCode":"MetaKeywords","Html":""}]', N'[{"DataSourceId":7,"Code":"Features","CSharpClassName":"Platformus.Domain.DataSources.PrimaryObjectsDataSource","Parameters":null}]')
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 3, 3, N'Contacts', N'/contacts', N'[{"PropertyId":162,"MemberCode":"Content","Html":"<p>Контакти</p>\r\n<p>Веб-сайт: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":163,"MemberCode":"Title","Html":"Контакти"},{"PropertyId":164,"MemberCode":"MetaDescription","Html":""},{"PropertyId":165,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 4, 5, N'Blog', N'/blog', N'[{"PropertyId":143,"MemberCode":"Content","Html":"<p>Блог</p>\r\n<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>"},{"PropertyId":144,"MemberCode":"Title","Html":"Блог"},{"PropertyId":145,"MemberCode":"MetaDescription","Html":""},{"PropertyId":146,"MemberCode":"MetaKeywords","Html":""}]', N'[{"DataSourceId":8,"Code":"BlogPosts","CSharpClassName":"Platformus.Domain.DataSources.ForeignObjectsDataSource","Parameters":null}]')
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 5, 6, N'BlogPost', N'/blog/post-1', N'[{"PropertyId":174,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":175,"MemberCode":"Preview","Html":"Пост 1"},{"PropertyId":176,"MemberCode":"Content","Html":"<p>Зміст посту 1</p>"},{"PropertyId":177,"MemberCode":"Title","Html":"Пост 1"},{"PropertyId":178,"MemberCode":"MetaDescription","Html":""},{"PropertyId":179,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 6, 6, N'BlogPost', N'/blog/post-2', N'[{"PropertyId":180,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":181,"MemberCode":"Preview","Html":"Пост 2"},{"PropertyId":182,"MemberCode":"Content","Html":"<p>Зміст посту 2</p>"},{"PropertyId":183,"MemberCode":"Title","Html":"Пост 2"},{"PropertyId":184,"MemberCode":"MetaDescription","Html":""},{"PropertyId":185,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 7, 6, N'BlogPost', N'/blog/post-3', N'[{"PropertyId":186,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":187,"MemberCode":"Preview","Html":"Пост 3"},{"PropertyId":188,"MemberCode":"Content","Html":"<p>Зміст посту 3</p>"},{"PropertyId":189,"MemberCode":"Title","Html":"Пост 3"},{"PropertyId":190,"MemberCode":"MetaDescription","Html":""},{"PropertyId":191,"MemberCode":"MetaKeywords","Html":""}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 8, 4, NULL, NULL, N'[{"PropertyId":73,"MemberCode":"Name","Html":"Модульна структура"},{"PropertyId":74,"MemberCode":"State","Html":"так"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 9, 4, NULL, NULL, N'[{"PropertyId":43,"MemberCode":"Name","Html":"Локалізація інтерфейсу користувача"},{"PropertyId":44,"MemberCode":"State","Html":"ні"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 10, 4, NULL, NULL, N'[{"PropertyId":45,"MemberCode":"Name","Html":"Локалізація контенту"},{"PropertyId":46,"MemberCode":"State","Html":"так"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (2, 11, 4, NULL, NULL, N'[{"PropertyId":47,"MemberCode":"Name","Html":"Гнучке управління контентом"},{"PropertyId":48,"MemberCode":"State","Html":"так"}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (3, 1, 1, N'Index', N'/', N'[{"PropertyId":192,"MemberCode":"Content","Html":null},{"PropertyId":193,"MemberCode":"Title","Html":null},{"PropertyId":194,"MemberCode":"MetaDescription","Html":null},{"PropertyId":195,"MemberCode":"MetaKeywords","Html":null}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (3, 2, 2, N'Features', N'/features', N'[{"PropertyId":166,"MemberCode":"Content","Html":null},{"PropertyId":167,"MemberCode":"Title","Html":null},{"PropertyId":168,"MemberCode":"MetaDescription","Html":null},{"PropertyId":169,"MemberCode":"MetaKeywords","Html":null}]', N'[{"DataSourceId":7,"Code":"Features","CSharpClassName":"Platformus.Domain.DataSources.PrimaryObjectsDataSource","Parameters":null}]')
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (3, 3, 3, N'Contacts', N'/contacts', N'[{"PropertyId":162,"MemberCode":"Content","Html":null},{"PropertyId":163,"MemberCode":"Title","Html":null},{"PropertyId":164,"MemberCode":"MetaDescription","Html":null},{"PropertyId":165,"MemberCode":"MetaKeywords","Html":null}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (3, 4, 5, N'Blog', N'/blog', N'[{"PropertyId":143,"MemberCode":"Content","Html":null},{"PropertyId":144,"MemberCode":"Title","Html":null},{"PropertyId":145,"MemberCode":"MetaDescription","Html":null},{"PropertyId":146,"MemberCode":"MetaKeywords","Html":null}]', N'[{"DataSourceId":8,"Code":"BlogPosts","CSharpClassName":"Platformus.Domain.DataSources.ForeignObjectsDataSource","Parameters":null}]')
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (3, 5, 6, N'BlogPost', N'/blog/post-1', N'[{"PropertyId":174,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":175,"MemberCode":"Preview","Html":null},{"PropertyId":176,"MemberCode":"Content","Html":null},{"PropertyId":177,"MemberCode":"Title","Html":null},{"PropertyId":178,"MemberCode":"MetaDescription","Html":null},{"PropertyId":179,"MemberCode":"MetaKeywords","Html":null}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (3, 6, 6, N'BlogPost', N'/blog/post-2', N'[{"PropertyId":180,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":181,"MemberCode":"Preview","Html":null},{"PropertyId":182,"MemberCode":"Content","Html":null},{"PropertyId":183,"MemberCode":"Title","Html":null},{"PropertyId":184,"MemberCode":"MetaDescription","Html":null},{"PropertyId":185,"MemberCode":"MetaKeywords","Html":null}]', NULL)
GO
INSERT [dbo].[CachedObjects] ([CultureId], [ObjectId], [ClassId], [ViewName], [Url], [CachedProperties], [CachedDataSources]) VALUES (3, 7, 6, N'BlogPost', N'/blog/post-3', N'[{"PropertyId":186,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":187,"MemberCode":"Preview","Html":null},{"PropertyId":188,"MemberCode":"Content","Html":null},{"PropertyId":189,"MemberCode":"Title","Html":null},{"PropertyId":190,"MemberCode":"MetaDescription","Html":null},{"PropertyId":191,"MemberCode":"MetaKeywords","Html":null}]', NULL)
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

GO
INSERT [dbo].[Classes] ([Id], [ClassId], [Code], [Name], [PluralizedName], [IsAbstract], [IsStandalone], [DefaultViewName]) VALUES (1, 7, N'IndexPage', N'Index Page', N'Index Pages', NULL, 1, N'Index')
GO
INSERT [dbo].[Classes] ([Id], [ClassId], [Code], [Name], [PluralizedName], [IsAbstract], [IsStandalone], [DefaultViewName]) VALUES (2, 7, N'FeaturesPage', N'Features Page', N'Features Pages', NULL, 1, N'Features')
GO
INSERT [dbo].[Classes] ([Id], [ClassId], [Code], [Name], [PluralizedName], [IsAbstract], [IsStandalone], [DefaultViewName]) VALUES (3, 7, N'ContactsPage', N'Contacts Page', N'Contacts Pages', NULL, 1, N'Contacts')
GO
INSERT [dbo].[Classes] ([Id], [ClassId], [Code], [Name], [PluralizedName], [IsAbstract], [IsStandalone], [DefaultViewName]) VALUES (4, NULL, N'Feature', N'Feature', N'Features', NULL, NULL, NULL)
GO
INSERT [dbo].[Classes] ([Id], [ClassId], [Code], [Name], [PluralizedName], [IsAbstract], [IsStandalone], [DefaultViewName]) VALUES (5, 7, N'BlogPage', N'Blog Page', N'Blog Pages', NULL, 1, N'Blog')
GO
INSERT [dbo].[Classes] ([Id], [ClassId], [Code], [Name], [PluralizedName], [IsAbstract], [IsStandalone], [DefaultViewName]) VALUES (6, 7, N'BlogPostPage', N'Blog Post Page', N'Blog Post Pages', NULL, 1, N'BlogPost')
GO
INSERT [dbo].[Classes] ([Id], [ClassId], [Code], [Name], [PluralizedName], [IsAbstract], [IsStandalone], [DefaultViewName]) VALUES (7, NULL, N'BasePage', N'Base Page', N'Base Pages', 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Configurations] ON 

GO
INSERT [dbo].[Configurations] ([Id], [Code], [Name]) VALUES (3, N'Email', N'Email')
GO
SET IDENTITY_INSERT [dbo].[Configurations] OFF
GO
SET IDENTITY_INSERT [dbo].[Credentials] ON 

GO
INSERT [dbo].[Credentials] ([Id], [UserId], [CredentialTypeId], [Identifier], [Secret]) VALUES (1, 1, 1, N'admin@platformus.net', N'21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3')
GO
SET IDENTITY_INSERT [dbo].[Credentials] OFF
GO
SET IDENTITY_INSERT [dbo].[CredentialTypes] ON 

GO
INSERT [dbo].[CredentialTypes] ([Id], [Code], [Name], [Position]) VALUES (1, N'Email', N'Email', 1)
GO
SET IDENTITY_INSERT [dbo].[CredentialTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Cultures] ON 

GO
INSERT [dbo].[Cultures] ([Id], [Code], [Name], [IsNeutral], [IsDefault]) VALUES (1, N'en', N'English', 0, 1)
GO
INSERT [dbo].[Cultures] ([Id], [Code], [Name], [IsNeutral], [IsDefault]) VALUES (2, N'uk', N'Українська', 0, 0)
GO
INSERT [dbo].[Cultures] ([Id], [Code], [Name], [IsNeutral], [IsDefault]) VALUES (3, N'__', N'Neutral', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Cultures] OFF
GO
SET IDENTITY_INSERT [dbo].[DataSources] ON 

GO
INSERT [dbo].[DataSources] ([Id], [ClassId], [Code], [CSharpClassName], [Parameters]) VALUES (7, 2, N'Features', N'Platformus.Domain.DataSources.PrimaryObjectsDataSource', NULL)
GO
INSERT [dbo].[DataSources] ([Id], [ClassId], [Code], [CSharpClassName], [Parameters]) VALUES (8, 5, N'BlogPosts', N'Platformus.Domain.DataSources.ForeignObjectsDataSource', NULL)
GO
SET IDENTITY_INSERT [dbo].[DataSources] OFF
GO
SET IDENTITY_INSERT [dbo].[DataTypes] ON 

GO
INSERT [dbo].[DataTypes] ([Id], [JavaScriptEditorClassName], [Name], [Position]) VALUES (1, N'singleLinePlainText', N'Single line plain text', 1)
GO
INSERT [dbo].[DataTypes] ([Id], [JavaScriptEditorClassName], [Name], [Position]) VALUES (2, N'multilinePlainText', N'Multiline plain text', 2)
GO
INSERT [dbo].[DataTypes] ([Id], [JavaScriptEditorClassName], [Name], [Position]) VALUES (3, N'html', N'Html', 3)
GO
INSERT [dbo].[DataTypes] ([Id], [JavaScriptEditorClassName], [Name], [Position]) VALUES (5, N'image', N'Image', 4)
GO
SET IDENTITY_INSERT [dbo].[DataTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Dictionaries] ON 

GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (43)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (44)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (45)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (46)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (47)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (48)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (53)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (54)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (55)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (56)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (57)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (58)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (59)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (60)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (61)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (82)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (83)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (161)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (162)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (163)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (164)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (180)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (181)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (182)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (183)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (184)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (185)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (186)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (187)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (192)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (193)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (194)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (195)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (196)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (197)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (198)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (199)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (200)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (201)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (202)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (203)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (204)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (205)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (206)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (207)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (208)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (209)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (210)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (211)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (212)
GO
INSERT [dbo].[Dictionaries] ([Id]) VALUES (213)
GO
SET IDENTITY_INSERT [dbo].[Dictionaries] OFF
GO
SET IDENTITY_INSERT [dbo].[Fields] ON 

GO
INSERT [dbo].[Fields] ([Id], [FormId], [FieldTypeId], [NameId], [Position]) VALUES (17, 5, 1, 59, 1)
GO
INSERT [dbo].[Fields] ([Id], [FormId], [FieldTypeId], [NameId], [Position]) VALUES (18, 5, 1, 60, 2)
GO
INSERT [dbo].[Fields] ([Id], [FormId], [FieldTypeId], [NameId], [Position]) VALUES (19, 5, 2, 61, 3)
GO
SET IDENTITY_INSERT [dbo].[Fields] OFF
GO
SET IDENTITY_INSERT [dbo].[FieldTypes] ON 

GO
INSERT [dbo].[FieldTypes] ([Id], [Code], [Name], [Position]) VALUES (1, N'TextBox', N'Text box', 1)
GO
INSERT [dbo].[FieldTypes] ([Id], [Code], [Name], [Position]) VALUES (2, N'TextArea', N'Text area', 2)
GO
INSERT [dbo].[FieldTypes] ([Id], [Code], [Name], [Position]) VALUES (3, N'DropDownList', N'Drop down list', 3)
GO
SET IDENTITY_INSERT [dbo].[FieldTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Forms] ON 

GO
INSERT [dbo].[Forms] ([Id], [Code], [NameId], [Email]) VALUES (5, N'Feedback', 58, N'admin@platformus.net')
GO
SET IDENTITY_INSERT [dbo].[Forms] OFF
GO
SET IDENTITY_INSERT [dbo].[Localizations] ON 

GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (85, 43, 2, N'Локалізація інтерфейсу користувача')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (86, 43, 1, N'User interface localization')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (87, 44, 1, N'no')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (88, 44, 2, N'ні')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (89, 45, 2, N'Локалізація контенту')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (90, 45, 1, N'Content localization')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (91, 46, 1, N'yes')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (92, 46, 2, N'так')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (93, 47, 2, N'Гнучке управління контентом')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (94, 47, 1, N'Flexible content management')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (95, 48, 1, N'yes')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (96, 48, 2, N'так')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (105, 53, 1, N'Main')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (106, 53, 2, N'Головне')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (107, 54, 1, N'Home')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (108, 54, 2, N'Головна')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (109, 55, 1, N'Features')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (110, 55, 2, N'Особливості')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (111, 56, 1, N'Blog')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (112, 56, 2, N'Блог')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (113, 57, 1, N'Contacts')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (114, 57, 2, N'Контакти')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (115, 58, 1, N'Feedback')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (116, 58, 2, N' Зворотний зв’язок')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (117, 59, 1, N'Your name')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (118, 59, 2, N'Ваше ім’я')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (119, 60, 1, N'Your phone')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (120, 60, 2, N'Ваш телефон')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (121, 61, 1, N'Your message')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (122, 61, 2, N'Ваше повідомлення')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (163, 82, 2, N'Модульна структура')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (164, 82, 1, N'Modular structure')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (165, 83, 1, N'yes')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (166, 83, 2, N'так')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (321, 161, 2, N'<p>Блог</p>
<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (322, 161, 1, N'<p>Blog</p>
<p>Only related objects demo.</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (323, 162, 2, N'Блог')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (324, 162, 1, N'Blog')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (325, 163, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (326, 163, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (327, 164, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (328, 164, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (359, 180, 2, N'<p>Контакти</p>
<p>Веб-сайт: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (360, 180, 1, N'<p>Contacts</p>
<p>Website: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (361, 181, 2, N'Контакти')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (362, 181, 1, N'Contacts')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (363, 182, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (364, 182, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (365, 183, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (366, 183, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (367, 184, 2, N'<p>Основні особливості CMS Platformus:</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (368, 184, 1, N'<p>The main features of the Platformus CMS:</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (369, 185, 2, N'Особливості')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (370, 185, 1, N'Features')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (371, 186, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (372, 186, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (373, 187, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (374, 187, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (383, 192, 3, N'/images/temp/img.png')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (384, 193, 2, N'Пост 1')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (385, 193, 1, N'Post 1')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (386, 194, 2, N'<p>Зміст посту 1</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (387, 194, 1, N'<p>Post 1 content</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (388, 195, 2, N'Пост 1')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (389, 195, 1, N'Post 1')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (390, 196, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (391, 196, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (392, 197, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (393, 197, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (394, 198, 3, N'/images/temp/img.png')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (395, 199, 2, N'Пост 2')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (396, 199, 1, N'Post 2')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (397, 200, 2, N'<p>Зміст посту 2</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (398, 200, 1, N'<p>Post&nbsp;2 content</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (399, 201, 2, N'Пост 2')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (400, 201, 1, N'Post 2')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (401, 202, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (402, 202, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (403, 203, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (404, 203, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (405, 204, 3, N'/images/temp/img.png')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (406, 205, 2, N'Пост 3')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (407, 205, 1, N'Post 3')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (408, 206, 2, N'<p>Зміст посту 3</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (409, 206, 1, N'<p>Post&nbsp;3 content</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (410, 207, 2, N'Пост 3')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (411, 207, 1, N'Post 3')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (412, 208, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (413, 208, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (414, 209, 1, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (415, 209, 2, N'')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (416, 210, 2, N'<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>
<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href="/backend/">бекенду</a>.</p>
<p>Електронна пошта: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Пароль: admin</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (417, 210, 1, N'<p>This is a demo website running on Platformus CMS.</p>
<p>You can manage it using the <a href="/backend/">backend</a>.</p>
<p>Email: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Password: admin</p>')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (418, 211, 2, N'Демонстраційний веб-сайт на CMS Platformus')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (419, 211, 1, N'Platformus CMS demo website')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (420, 212, 2, N'CMS, Platformus')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (421, 212, 1, N'CMS, Platformus')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (422, 213, 1, N'This is a demo website running on Platformus CMS.')
GO
INSERT [dbo].[Localizations] ([Id], [DictionaryId], [CultureId], [Value]) VALUES (423, 213, 2, N'Це демонстраційний веб-сайт, що працює на CMS Platformus.')
GO
SET IDENTITY_INSERT [dbo].[Localizations] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (1, 1, NULL, N'Content', N'Content', 1, 3, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (5, 2, NULL, N'Content', N'Content', 1, 3, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (9, 3, NULL, N'Content', N'Content', 1, 3, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (13, 4, NULL, N'Name', N'Name', 1, 1, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (14, 4, NULL, N'State', N'State', 2, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (15, 5, NULL, N'Content', N'Content', 1, 3, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (19, 6, NULL, N'Preview', N'Preview', 3, 2, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (20, 6, NULL, N'Content', N'Content', 4, 3, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (24, 6, NULL, N'BlogPage', N'Blog page', 1, NULL, NULL, NULL, 5, 1)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (25, 2, 6, N'Features', N'Features', 2, NULL, NULL, NULL, 4, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (26, 7, 7, N'Title', N'Title', 100, 1, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (27, 7, 7, N'MetaDescription', N'META description', 101, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (28, 7, 7, N'MetaKeywords', N'META keywords', 102, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Members] ([Id], [ClassId], [TabId], [Code], [Name], [Position], [PropertyDataTypeId], [IsPropertyLocalizable], [IsPropertyVisibleInList], [RelationClassId], [IsRelationSingleParent]) VALUES (29, 6, NULL, N'Image', N'Image', 2, 5, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

GO
INSERT [dbo].[MenuItems] ([Id], [MenuId], [MenuItemId], [NameId], [Url], [Position]) VALUES (39, 6, NULL, 54, N'/1', 1)
GO
INSERT [dbo].[MenuItems] ([Id], [MenuId], [MenuItemId], [NameId], [Url], [Position]) VALUES (40, 6, NULL, 55, N'/2', 2)
GO
INSERT [dbo].[MenuItems] ([Id], [MenuId], [MenuItemId], [NameId], [Url], [Position]) VALUES (41, 6, NULL, 56, N'/3', 3)
GO
INSERT [dbo].[MenuItems] ([Id], [MenuId], [MenuItemId], [NameId], [Url], [Position]) VALUES (42, 6, NULL, 57, N'/4', 4)
GO
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

GO
INSERT [dbo].[Menus] ([Id], [Code], [NameId]) VALUES (6, N'Main', 53)
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Objects] ON 

GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (1, 1, NULL, N'/')
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (2, 2, NULL, N'/features')
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (3, 3, NULL, N'/contacts')
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (4, 5, NULL, N'/blog')
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (5, 6, NULL, N'/blog/post-1')
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (6, 6, NULL, N'/blog/post-2')
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (7, 6, NULL, N'/blog/post-3')
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (8, 4, NULL, NULL)
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (9, 4, NULL, NULL)
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (10, 4, NULL, NULL)
GO
INSERT [dbo].[Objects] ([Id], [ClassId], [ViewName], [Url]) VALUES (11, 4, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Objects] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

GO
INSERT [dbo].[Permissions] ([Id], [Code], [Name], [Position]) VALUES (1, N'DoEverything', N'Do everything', 1)
GO
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON 

GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (43, 9, 13, 43)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (44, 9, 14, 44)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (45, 10, 13, 45)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (46, 10, 14, 46)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (47, 11, 13, 47)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (48, 11, 14, 48)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (73, 8, 13, 82)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (74, 8, 14, 83)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (143, 4, 15, 161)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (144, 4, 26, 162)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (145, 4, 27, 163)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (146, 4, 28, 164)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (162, 3, 9, 180)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (163, 3, 26, 181)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (164, 3, 27, 182)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (165, 3, 28, 183)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (166, 2, 5, 184)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (167, 2, 26, 185)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (168, 2, 27, 186)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (169, 2, 28, 187)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (174, 5, 29, 192)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (175, 5, 19, 193)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (176, 5, 20, 194)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (177, 5, 26, 195)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (178, 5, 27, 196)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (179, 5, 28, 197)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (180, 6, 29, 198)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (181, 6, 19, 199)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (182, 6, 20, 200)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (183, 6, 26, 201)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (184, 6, 27, 202)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (185, 6, 28, 203)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (186, 7, 29, 204)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (187, 7, 19, 205)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (188, 7, 20, 206)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (189, 7, 26, 207)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (190, 7, 27, 208)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (191, 7, 28, 209)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (192, 1, 1, 210)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (193, 1, 26, 211)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (194, 1, 27, 212)
GO
INSERT [dbo].[Properties] ([Id], [ObjectId], [MemberId], [HtmlId]) VALUES (195, 1, 28, 213)
GO
SET IDENTITY_INSERT [dbo].[Properties] OFF
GO
SET IDENTITY_INSERT [dbo].[Relations] ON 

GO
INSERT [dbo].[Relations] ([Id], [MemberId], [PrimaryId], [ForeignId]) VALUES (111, 25, 11, 2)
GO
INSERT [dbo].[Relations] ([Id], [MemberId], [PrimaryId], [ForeignId]) VALUES (112, 25, 10, 2)
GO
INSERT [dbo].[Relations] ([Id], [MemberId], [PrimaryId], [ForeignId]) VALUES (113, 25, 9, 2)
GO
INSERT [dbo].[Relations] ([Id], [MemberId], [PrimaryId], [ForeignId]) VALUES (114, 25, 8, 2)
GO
INSERT [dbo].[Relations] ([Id], [MemberId], [PrimaryId], [ForeignId]) VALUES (115, 24, 4, 5)
GO
INSERT [dbo].[Relations] ([Id], [MemberId], [PrimaryId], [ForeignId]) VALUES (116, 24, 4, 6)
GO
INSERT [dbo].[Relations] ([Id], [MemberId], [PrimaryId], [ForeignId]) VALUES (117, 24, 4, 7)
GO
SET IDENTITY_INSERT [dbo].[Relations] OFF
GO
INSERT [dbo].[RolePermissions] ([RoleId], [PermissionId]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([Id], [Code], [Name], [Position]) VALUES (1, N'Administrator', N'Administrator', 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tabs] ON 

GO
INSERT [dbo].[Tabs] ([Id], [ClassId], [Name], [Position]) VALUES (6, 2, N'Features', 1)
GO
INSERT [dbo].[Tabs] ([Id], [ClassId], [Name], [Position]) VALUES (7, 7, N'SEO', 100)
GO
SET IDENTITY_INSERT [dbo].[Tabs] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [Name], [Created]) VALUES (1, N'Administrator', 1441274400)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Variables] ON 

GO
INSERT [dbo].[Variables] ([Id], [ConfigurationId], [Code], [Name], [Value], [Position]) VALUES (3, 3, N'SmtpServer', N'SMTP server', N'test', 1)
GO
INSERT [dbo].[Variables] ([Id], [ConfigurationId], [Code], [Name], [Value], [Position]) VALUES (4, 3, N'SmtpPort', N'SMTP port', N'25', 2)
GO
INSERT [dbo].[Variables] ([Id], [ConfigurationId], [Code], [Name], [Value], [Position]) VALUES (5, 3, N'SmtpLogin', N'SMTP login', N'test', 3)
GO
INSERT [dbo].[Variables] ([Id], [ConfigurationId], [Code], [Name], [Value], [Position]) VALUES (6, 3, N'SmtpPassword', N'SMTP password', N'test', 4)
GO
INSERT [dbo].[Variables] ([Id], [ConfigurationId], [Code], [Name], [Value], [Position]) VALUES (7, 3, N'SmtpSenderEmail', N'SMTP sender email', N'test', 5)
GO
INSERT [dbo].[Variables] ([Id], [ConfigurationId], [Code], [Name], [Value], [Position]) VALUES (8, 3, N'SmtpSenderName', N'SMTP sender name', N'test', 6)
GO
SET IDENTITY_INSERT [dbo].[Variables] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CachedForms]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_CachedForms] ON [dbo].[CachedForms]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CachedMenus]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_CachedMenus] ON [dbo].[CachedMenus]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CachedObjects]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_CachedObjects] ON [dbo].[CachedObjects]
(
	[Url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Classes]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Classes] ON [dbo].[Classes]
(
	[IsStandalone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Configurations]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Configurations] ON [dbo].[Configurations]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Credentials]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Credentials] ON [dbo].[Credentials]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CredentialTypes]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_CredentialTypes] ON [dbo].[CredentialTypes]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Cultures]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Cultures] ON [dbo].[Cultures]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataSources]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_DataSources] ON [dbo].[DataSources]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldOptions]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_FieldOptions] ON [dbo].[FieldOptions]
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fields]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Fields] ON [dbo].[Fields]
(
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FieldTypes]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_FieldTypes] ON [dbo].[FieldTypes]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Forms]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Forms] ON [dbo].[Forms]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Localizations_DictionaryId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Localizations_DictionaryId] ON [dbo].[Localizations]
(
	[DictionaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Localizations_DictionaryId_CultureId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Localizations_DictionaryId_CultureId] ON [dbo].[Localizations]
(
	[CultureId] ASC,
	[DictionaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Members]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Members] ON [dbo].[Members]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuItems_MenuId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_MenuItems_MenuId] ON [dbo].[MenuItems]
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuItems_MenuItemId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_MenuItems_MenuItemId] ON [dbo].[MenuItems]
(
	[MenuItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Menus]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Menus] ON [dbo].[Menus]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Objects_ClassId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Objects_ClassId] ON [dbo].[Objects]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Objects_Url]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Objects_Url] ON [dbo].[Objects]
(
	[Url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Permissions]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Permissions] ON [dbo].[Permissions]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Properties_ObjectId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Properties_ObjectId] ON [dbo].[Properties]
(
	[ObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Properties_ObjectId_MemberId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Properties_ObjectId_MemberId] ON [dbo].[Properties]
(
	[ObjectId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relations_ForeignId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relations_ForeignId] ON [dbo].[Relations]
(
	[ForeignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relations_MemberId_ForeignId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relations_MemberId_ForeignId] ON [dbo].[Relations]
(
	[MemberId] ASC,
	[ForeignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relations_MemberId_PrimaryId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relations_MemberId_PrimaryId] ON [dbo].[Relations]
(
	[PrimaryId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relations_PrimaryId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relations_PrimaryId] ON [dbo].[Relations]
(
	[PrimaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Roles]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Roles] ON [dbo].[Roles]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tabs]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Tabs] ON [dbo].[Tabs]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Variables_ConfigurationId]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Variables_ConfigurationId] ON [dbo].[Variables]
(
	[ConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Variables_ConfigurationId_Code]    Script Date: 10.01.2017 12:20:47 ******/
CREATE NONCLUSTERED INDEX [IX_Variables_ConfigurationId_Code] ON [dbo].[Variables]
(
	[ConfigurationId] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CachedForms]  WITH CHECK ADD  CONSTRAINT [FK_CachedForms_Cultures] FOREIGN KEY([CultureId])
REFERENCES [dbo].[Cultures] ([Id])
GO
ALTER TABLE [dbo].[CachedForms] CHECK CONSTRAINT [FK_CachedForms_Cultures]
GO
ALTER TABLE [dbo].[CachedForms]  WITH CHECK ADD  CONSTRAINT [FK_CachedForms_Forms] FOREIGN KEY([FormId])
REFERENCES [dbo].[Forms] ([Id])
GO
ALTER TABLE [dbo].[CachedForms] CHECK CONSTRAINT [FK_CachedForms_Forms]
GO
ALTER TABLE [dbo].[CachedMenus]  WITH CHECK ADD  CONSTRAINT [FK_CachedMenus_Cultures] FOREIGN KEY([CultureId])
REFERENCES [dbo].[Cultures] ([Id])
GO
ALTER TABLE [dbo].[CachedMenus] CHECK CONSTRAINT [FK_CachedMenus_Cultures]
GO
ALTER TABLE [dbo].[CachedMenus]  WITH CHECK ADD  CONSTRAINT [FK_CachedMenus_Menus] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menus] ([Id])
GO
ALTER TABLE [dbo].[CachedMenus] CHECK CONSTRAINT [FK_CachedMenus_Menus]
GO
ALTER TABLE [dbo].[CachedObjects]  WITH CHECK ADD  CONSTRAINT [FK_CachedObjects_Cultures] FOREIGN KEY([CultureId])
REFERENCES [dbo].[Cultures] ([Id])
GO
ALTER TABLE [dbo].[CachedObjects] CHECK CONSTRAINT [FK_CachedObjects_Cultures]
GO
ALTER TABLE [dbo].[CachedObjects]  WITH CHECK ADD  CONSTRAINT [FK_CachedObjects_Objects] FOREIGN KEY([ObjectId])
REFERENCES [dbo].[Objects] ([Id])
GO
ALTER TABLE [dbo].[CachedObjects] CHECK CONSTRAINT [FK_CachedObjects_Objects]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_Classes]
GO
ALTER TABLE [dbo].[CompletedFields]  WITH CHECK ADD  CONSTRAINT [FK_CompletedFields_CompletedForms] FOREIGN KEY([CompletedFormId])
REFERENCES [dbo].[CompletedForms] ([Id])
GO
ALTER TABLE [dbo].[CompletedFields] CHECK CONSTRAINT [FK_CompletedFields_CompletedForms]
GO
ALTER TABLE [dbo].[CompletedFields]  WITH CHECK ADD  CONSTRAINT [FK_CompletedFields_Fields] FOREIGN KEY([FieldId])
REFERENCES [dbo].[Fields] ([Id])
GO
ALTER TABLE [dbo].[CompletedFields] CHECK CONSTRAINT [FK_CompletedFields_Fields]
GO
ALTER TABLE [dbo].[CompletedForms]  WITH CHECK ADD  CONSTRAINT [FK_CompletedForms_Forms] FOREIGN KEY([FormId])
REFERENCES [dbo].[Forms] ([Id])
GO
ALTER TABLE [dbo].[CompletedForms] CHECK CONSTRAINT [FK_CompletedForms_Forms]
GO
ALTER TABLE [dbo].[Credentials]  WITH CHECK ADD  CONSTRAINT [FK_Credentials_CredentialTypes] FOREIGN KEY([CredentialTypeId])
REFERENCES [dbo].[CredentialTypes] ([Id])
GO
ALTER TABLE [dbo].[Credentials] CHECK CONSTRAINT [FK_Credentials_CredentialTypes]
GO
ALTER TABLE [dbo].[Credentials]  WITH CHECK ADD  CONSTRAINT [FK_Credentials_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Credentials] CHECK CONSTRAINT [FK_Credentials_Users]
GO
ALTER TABLE [dbo].[DataSources]  WITH CHECK ADD  CONSTRAINT [FK_DataSources_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[DataSources] CHECK CONSTRAINT [FK_DataSources_Classes]
GO
ALTER TABLE [dbo].[FieldOptions]  WITH CHECK ADD  CONSTRAINT [FK_FieldOptions_Dictionaries] FOREIGN KEY([ValueId])
REFERENCES [dbo].[Dictionaries] ([Id])
GO
ALTER TABLE [dbo].[FieldOptions] CHECK CONSTRAINT [FK_FieldOptions_Dictionaries]
GO
ALTER TABLE [dbo].[FieldOptions]  WITH CHECK ADD  CONSTRAINT [FK_FieldOptions_Fields] FOREIGN KEY([FieldId])
REFERENCES [dbo].[Fields] ([Id])
GO
ALTER TABLE [dbo].[FieldOptions] CHECK CONSTRAINT [FK_FieldOptions_Fields]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_Dictionaries] FOREIGN KEY([NameId])
REFERENCES [dbo].[Dictionaries] ([Id])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_Dictionaries]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldTypes] FOREIGN KEY([FieldTypeId])
REFERENCES [dbo].[FieldTypes] ([Id])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_FieldTypes]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_Forms] FOREIGN KEY([FormId])
REFERENCES [dbo].[Forms] ([Id])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_Forms]
GO
ALTER TABLE [dbo].[Forms]  WITH CHECK ADD  CONSTRAINT [FK_Forms_Dictionaries] FOREIGN KEY([NameId])
REFERENCES [dbo].[Dictionaries] ([Id])
GO
ALTER TABLE [dbo].[Forms] CHECK CONSTRAINT [FK_Forms_Dictionaries]
GO
ALTER TABLE [dbo].[Localizations]  WITH CHECK ADD  CONSTRAINT [FK_Localizations_Cultures] FOREIGN KEY([CultureId])
REFERENCES [dbo].[Cultures] ([Id])
GO
ALTER TABLE [dbo].[Localizations] CHECK CONSTRAINT [FK_Localizations_Cultures]
GO
ALTER TABLE [dbo].[Localizations]  WITH CHECK ADD  CONSTRAINT [FK_Localizations_Dictionaries] FOREIGN KEY([DictionaryId])
REFERENCES [dbo].[Dictionaries] ([Id])
GO
ALTER TABLE [dbo].[Localizations] CHECK CONSTRAINT [FK_Localizations_Dictionaries]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_ClassId_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_ClassId_Classes]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_DataTypes] FOREIGN KEY([PropertyDataTypeId])
REFERENCES [dbo].[DataTypes] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_DataTypes]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_RelationClassId_Classes] FOREIGN KEY([RelationClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_RelationClassId_Classes]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Tabs] FOREIGN KEY([TabId])
REFERENCES [dbo].[Tabs] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Tabs]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Dictionaries] FOREIGN KEY([NameId])
REFERENCES [dbo].[Dictionaries] ([Id])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Dictionaries]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_MenuItems] FOREIGN KEY([MenuItemId])
REFERENCES [dbo].[MenuItems] ([Id])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_MenuItems]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Menus] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menus] ([Id])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Menus]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Dictionaries] FOREIGN KEY([NameId])
REFERENCES [dbo].[Dictionaries] ([Id])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Dictionaries]
GO
ALTER TABLE [dbo].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Objects] CHECK CONSTRAINT [FK_Objects_Classes]
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_Dictionaries] FOREIGN KEY([HtmlId])
REFERENCES [dbo].[Dictionaries] ([Id])
GO
ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_Dictionaries]
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_Members]
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_Objects] FOREIGN KEY([ObjectId])
REFERENCES [dbo].[Objects] ([Id])
GO
ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_Objects]
GO
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD  CONSTRAINT [FK_Relations_ForeignId_Objects] FOREIGN KEY([ForeignId])
REFERENCES [dbo].[Objects] ([Id])
GO
ALTER TABLE [dbo].[Relations] CHECK CONSTRAINT [FK_Relations_ForeignId_Objects]
GO
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD  CONSTRAINT [FK_Relations_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Relations] CHECK CONSTRAINT [FK_Relations_Members]
GO
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD  CONSTRAINT [FK_Relations_PrimaryId_Objects] FOREIGN KEY([PrimaryId])
REFERENCES [dbo].[Objects] ([Id])
GO
ALTER TABLE [dbo].[Relations] CHECK CONSTRAINT [FK_Relations_PrimaryId_Objects]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([Id])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permissions]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[Tabs]  WITH CHECK ADD  CONSTRAINT [FK_Tabs_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Tabs] CHECK CONSTRAINT [FK_Tabs_Classes]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Variables]  WITH CHECK ADD  CONSTRAINT [FK_Variables_Configurations] FOREIGN KEY([ConfigurationId])
REFERENCES [dbo].[Configurations] ([Id])
GO
ALTER TABLE [dbo].[Variables] CHECK CONSTRAINT [FK_Variables_Configurations]
GO
USE [master]
GO
ALTER DATABASE [Platformus] SET  READ_WRITE 
GO
