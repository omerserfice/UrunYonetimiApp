USE [urunDb]
GO
/****** Object:  Trigger [dbo].[ProductDecrement]    Script Date: 1.08.2022 20:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[ProductDecrement]
On [dbo].[CustomerProducts]
After Insert
As
Declare @ProductId int
Declare @CustomerId int
Declare @Quantity int
Select  @ProductId=ProductId,@Quantity=Quantity,@CustomerId=CustomerId from inserted
Update Products set Quantity=Quantity-@Quantity where Id=@ProductId