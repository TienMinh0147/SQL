---Văn Tiến Minh
-- bai 1.1

DECLARE @a int ,
 @Tổng int
SET @a = 10
SET @Tổng = 0
WHILE (@a <= 20)
BEGIN
 SELECT @Tổng = @Tổng + @a
 SET @a = @a + 1
END
SELECT @Tổng

--bài 1.2
If OBJECT_ID('tempdb..#FirstInvoice') is not null
		drop table #FirstInvoice
		
Create table #FirstInvoice(VendorID int, FirstInvoiceDate datetime)
insert into #FirstInvoice SELECT VendorID, MIN(InvoiceDate) AS FirstInvoiceDate FROM Invoices GROUP BY VendorID

SELECT VendorName, FirstInvoiceDate, InvoiceTotal
 FROM Invoices JOIN #FirstInvoice
ON (Invoices.VendorID = #FirstInvoice.VendorID AND Invoices.InvoiceDate = #FirstInvoice.FirstInvoiceDate)
 JOIN Vendors ON Invoices.VendorID = Vendors.VendorID ORDER BY VendorName, FirstInvoiceDate
 ---Bài 2
 ---bài 2.a
  select cast(invoiceTotal as decimal(19,3)),
  CAST(InvoiceTotal as varchar),
  CONVERT(decimal(19,3),InvoiceTotal),
  CONVERT(varchar,InvoiceTotal,1)
  from Invoices

 --bài 2 b
 select 
 CONVERT(varchar,invoiceTotal,0),
 CONVERT(varchar,invoiceTotal,1)
 From Invoices
 --bài 2 c
 select
 REPLACE(CAST(InvoiceTotal AS varchar),'.',','),
 REPLACE(LEFT(CONVERT(varchar,InvoiceTotal,1),
 LEN(CONVERT(varchar,InvoiceTotal,1))-3),',','.'),
 + ',' +
RIGHT(CONVERT(varchar,InvoiceTotal,1),2)
from Invoices
--bài 2.2
select 
   cast (Invoicedate as varchar),
   convert(varchar,Invoicedate,103),
   convert(varchar,Invoicedate,101),
   convert(varchar,Invoicedate,105),
   convert(varchar,Invoicedate,110)
   from Invoices
----bài 2.3
select
CONVERT (varchar, VendorContactFName) + ' ' + LEFT(VendorContactLName,1) + '.' as Name,
upper(CONVERT (varchar, VendorContactFName) + ' ' + LEFT(VendorContactLName,1) + '.') as NAME,
substring(VendorPhone,7,8) as Phone
from Vendors where VendorPhone LIKE '%(559)%' order by VendorContactFName, VendorContactLName
