use AP
go

Declare @totalDue money
Set @totalDue = (Select SUM(Invoicetotal - paymentTotal - CreditTotal)
From Invoices)
if @totalDue > 10000
	Select VendorName,InvoiceNumber,InvoicedueDate,SUM(InvoiceTotal-PaymentTotal-credittotal) as balance
	From Vendors Inner join Invoices on Vendors.VendorID = Invoices.VendorID
	group by VendorName, InvoiceNumber,InvoiceDueDate
	order by InvoiceDueDate ASC
else
print 'Dư nợ nhỏ hơn 10000 USD'

--
DECLARE @VendorName VARCHAR(50),
        @VendorID INT;

----Thực hiện câu lệnh Insert để chèn VendorID,VendorName của các nhà cung cấp có VendorSta bằng 'CA' được truy xuất từ bảng Vendors

insert into Vendors select VendorID,VendorName from Vendors where VendorState ='CA'
-----truy xuất dữ liệu bảng vendors
select * from Vendors
---update dữ liệu
update Vendors
set VendorName='Minh'
where VendorName='HÙng'
---delete dữ liệu
delete from Vendors
where vendorID=6
----INSERT dữ liệu
insert into Vendors values (2,'Minhvt02930')
INSERT INTO Vendors
                         (VendorCity)
VALUES        ('Hà Nội,Hải Phòng')
--Viết câu lệnh select trả về tất cả cấc cột từ biến bảng Vendor và bảng Invoices
SELECT        Vendors.*
FROM            Vendors INNER JOIN
                         Invoices ON Vendors.VendorID = Invoices.VendorID