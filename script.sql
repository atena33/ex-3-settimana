USE [master]
GO
/****** Object:  Database [Polizia_Anna]    Script Date: 14/05/2021 12:44:47 ******/
CREATE DATABASE [Polizia_Anna]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Polizia_Anna', FILENAME = N'C:\Users\Anna\Polizia_Anna.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Polizia_Anna_log', FILENAME = N'C:\Users\Anna\Polizia_Anna_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Polizia_Anna] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Polizia_Anna].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Polizia_Anna] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Polizia_Anna] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Polizia_Anna] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Polizia_Anna] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Polizia_Anna] SET ARITHABORT OFF 
GO
ALTER DATABASE [Polizia_Anna] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Polizia_Anna] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Polizia_Anna] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Polizia_Anna] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Polizia_Anna] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Polizia_Anna] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Polizia_Anna] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Polizia_Anna] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Polizia_Anna] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Polizia_Anna] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Polizia_Anna] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Polizia_Anna] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Polizia_Anna] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Polizia_Anna] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Polizia_Anna] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Polizia_Anna] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Polizia_Anna] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Polizia_Anna] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Polizia_Anna] SET  MULTI_USER 
GO
ALTER DATABASE [Polizia_Anna] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Polizia_Anna] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Polizia_Anna] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Polizia_Anna] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Polizia_Anna] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Polizia_Anna] SET QUERY_STORE = OFF
GO
USE [Polizia_Anna]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Polizia_Anna]
GO
/****** Object:  Table [dbo].[Agente]    Script Date: 14/05/2021 12:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agente](
	[idAgente] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Cognome] [nvarchar](50) NOT NULL,
	[CodiceFiscale] [nvarchar](16) NOT NULL,
	[DataNascita] [date] NOT NULL,
	[AnniServizio] [int] NOT NULL,
 CONSTRAINT [PK_Agente] PRIMARY KEY CLUSTERED 
(
	[idAgente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaMetropolitana]    Script Date: 14/05/2021 12:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaMetropolitana](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[CodiceArea] [nchar](5) NOT NULL,
	[AltoRischio] [bit] NOT NULL,
	[IdAgente] [int] NOT NULL,
 CONSTRAINT [PK_AreaMetropolitana] PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Agente]    Script Date: 14/05/2021 12:44:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Agente] ON [dbo].[Agente]
(
	[CodiceFiscale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Agente_1]    Script Date: 14/05/2021 12:44:48 ******/
CREATE NONCLUSTERED INDEX [IX_Agente_1] ON [dbo].[Agente]
(
	[DataNascita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AreaMetropolitana]  WITH CHECK ADD  CONSTRAINT [FK_AreaMetropolitana_Agente] FOREIGN KEY([IdAgente])
REFERENCES [dbo].[Agente] ([idAgente])
GO
ALTER TABLE [dbo].[AreaMetropolitana] CHECK CONSTRAINT [FK_AreaMetropolitana_Agente]
GO
ALTER TABLE [dbo].[Agente]  WITH CHECK ADD  CONSTRAINT [CK_Agente] CHECK  (([DataNascita]>='2003/05/13'))
GO
ALTER TABLE [dbo].[Agente] CHECK CONSTRAINT [CK_Agente]
GO
/****** Object:  StoredProcedure [dbo].[AgenteRischio]    Script Date: 14/05/2021 12:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AgenteRischio] 
	
AS
BEGIN
	
    -- Insert statements for procedure here
	SELECT *, AreaMetropolitana.AltoRischio from Agente 
	join AreaMetropolitana on Agente.idAgente = AreaMetropolitana.idAgente
	where (Agente.AnniServizio < 3) AND (AreaMetropolitana.AltoRischio = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[CancellaAgente]    Script Date: 14/05/2021 12:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CancellaAgente] 
	-- Add the parameters for the stored procedure here
	@idAgente int 
	
AS
BEGIN
	delete from Agente where idAgente = @idAgente
END
GO
/****** Object:  StoredProcedure [dbo].[CountAgenteArea]    Script Date: 14/05/2021 12:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CountAgenteArea] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	SELECT CodiceArea, Count(idAgente)from AreaMetropolitana
	group by CodiceArea
END
GO
/****** Object:  StoredProcedure [dbo].[InserisciAgente]    Script Date: 14/05/2021 12:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[InserisciAgente] 
	-- Add the parameters for the stored procedure here
	
	@nome nvarchar(30), 
	@cognome nvarchar(50),
	@codiceFiscale nvarchar (16),
	@dataNascita date,
	@anniServizio int
AS
BEGIN
	
	insert into Agente values ( @nome, @cognome, @codiceFiscale, @dataNascita,@anniServizio)
END
GO
USE [master]
GO
ALTER DATABASE [Polizia_Anna] SET  READ_WRITE 
GO
