USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 07/10/2021 14:26:34 ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MuseiAcademyI', FILENAME = N'C:\Users\elena.dal.savio\MuseiAcademyI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MuseiAcademyI_log', FILENAME = N'C:\Users\elena.dal.savio\MuseiAcademyI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerce] SET QUERY_STORE = OFF
GO
USE [ECommerce]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Carta]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carta](
	[IdCarta] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](30) NOT NULL,
	[Scadenza] [datetime] NOT NULL,
	[Saldo] [decimal](18, 0) NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Carta] PRIMARY KEY CLUSTERED 
(
	[IdCarta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Nome] [nvarchar](50) NOT NULL,
	[Cognome] [nvarchar](50) NOT NULL,
	[DataNascita] [date] NOT NULL,
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indirizzo]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indirizzo](
	[IdIndirizzo] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](30) NOT NULL,
	[Città] [nvarchar](30) NOT NULL,
	[Via] [nvarchar](30) NOT NULL,
	[Cap] [int] NOT NULL,
	[NCivico] [nvarchar](30) NOT NULL,
	[Provincia] [nvarchar](30) NOT NULL,
	[Nazione] [nvarchar](30) NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Indirizzo] PRIMARY KEY CLUSTERED 
(
	[IdIndirizzo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordine]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordine](
	[IdOrdine] [int] IDENTITY(1,1) NOT NULL,
	[Stato] [nvarchar](20) NOT NULL,
	[Data] [date] NOT NULL,
	[Totale] [decimal](18, 0) NULL,
	[IdCliente] [int] NOT NULL,
	[IdCarta] [int] NOT NULL,
	[IdIndirizzo] [int] NOT NULL,
 CONSTRAINT [PK_Ordine] PRIMARY KEY CLUSTERED 
(
	[IdOrdine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdineProdotto]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdineProdotto](
	[IdOrdine] [int] NOT NULL,
	[IdProdotto] [int] NOT NULL,
	[Quantità] [int] NOT NULL,
	[Subtotale] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrdineProdotto] PRIMARY KEY CLUSTERED 
(
	[IdOrdine] ASC,
	[IdProdotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prodotto]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodotto](
	[IdProdotto] [int] IDENTITY(1,1) NOT NULL,
	[CodiceProdotto] [nvarchar](5) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Descrizione] [nvarchar](100) NOT NULL,
	[Prezzo] [decimal](18, 0) NOT NULL,
	[QuantitàDisponibile] [int] NULL,
 CONSTRAINT [PK_Prodotto] PRIMARY KEY CLUSTERED 
(
	[IdProdotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carta]  WITH CHECK ADD  CONSTRAINT [FK_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Carta] CHECK CONSTRAINT [FK_Cliente]
GO
ALTER TABLE [dbo].[Indirizzo]  WITH CHECK ADD  CONSTRAINT [FK_ClienteIndirizzo] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Indirizzo] CHECK CONSTRAINT [FK_ClienteIndirizzo]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [FK_CartaOrdine] FOREIGN KEY([IdCarta])
REFERENCES [dbo].[Carta] ([IdCarta])
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [FK_CartaOrdine]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [FK_ClienteOrdine] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [FK_ClienteOrdine]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [FK_IndirizzoOrdine] FOREIGN KEY([IdIndirizzo])
REFERENCES [dbo].[Indirizzo] ([IdIndirizzo])
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [FK_IndirizzoOrdine]
GO
ALTER TABLE [dbo].[OrdineProdotto]  WITH CHECK ADD  CONSTRAINT [FK_OrdineP] FOREIGN KEY([IdOrdine])
REFERENCES [dbo].[Ordine] ([IdOrdine])
GO
ALTER TABLE [dbo].[OrdineProdotto] CHECK CONSTRAINT [FK_OrdineP]
GO
ALTER TABLE [dbo].[OrdineProdotto]  WITH CHECK ADD  CONSTRAINT [FK_ProdottoO] FOREIGN KEY([IdProdotto])
REFERENCES [dbo].[Prodotto] ([IdProdotto])
GO
ALTER TABLE [dbo].[OrdineProdotto] CHECK CONSTRAINT [FK_ProdottoO]
GO
/****** Object:  StoredProcedure [dbo].[InserisciCartaCliente]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InserisciCartaCliente]
@NomeCli nvarchar(50),
@Tipo nvarchar(30),
@Scadenza datetime,
@Saldo decimal
as
declare @ID_CLIENTE int 
select @ID_CLIENTE=c.IdCliente from Cliente c where c.Nome=@NomeCli

insert into Carta values (@Tipo, @Scadenza, @Saldo, @ID_CLIENTE);
GO
/****** Object:  StoredProcedure [dbo].[InserisciCliente]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InserisciCliente]
@NomeCliente nvarchar(50),
@CognomeCliente nvarchar(50),
@DataNascita date
AS
insert into Cliente values(@NomeCliente, @CognomeCliente, @DataNascita)
GO
/****** Object:  StoredProcedure [dbo].[InserisciIndirizzoCliente]    Script Date: 07/10/2021 14:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InserisciIndirizzoCliente]
@NomeClie nvarchar(50),
@TipoIndirizzo nvarchar(30),
@Città nvarchar(30),
@Via nvarchar(30),
@Cap int,
@NCivico nvarchar(30),
@Provincia nvarchar(30),
@Nazione nvarchar(30)

as

declare @ID_CLIENTE2 int 
select @ID_CLIENTE2=c.IdCliente from Cliente c where c.Nome=@NomeClie

insert into Indirizzo values (@TipoIndirizzo, @Città, @Via, @Cap, @NCivico, @Provincia, @Nazione, @ID_CLIENTE2);
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
