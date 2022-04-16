--Văn Tiến Minh
--PD02930
----BÀI 2	Sử dụng của sổ Query Desinger

--1.Câu lệnh Select trả về toàn bộ dữ liệu của bảng Vendors
SELECT        Vendors.*
FROM            Vendors


--2.Câu lệnh Select trả về tất cả các hàng của bảng Vendors với cột VendorState có giá trị là `CA`
SELECT        VendorState
FROM            Vendors
WHERE        (VendorState = 'CA')


--3.Câu lệnh Select trả về tất cả các hàng của bảng Vendors với với tên nhà cung cấp(VendorName) bắt đầu bằng kí tự `D`
SELECT        VendorName  [Nhà cung cấp]
FROM            Vendors
WHERE        VendorName like 'D%'


--4.Câu lệnh UPDATE cập nhật giá trị cột VendorAddress2 bằng giá trị cột VendorAddress1 ứng với VendorID=1
UPDATE       Vendors
SET                VendorAddress2 = VendorAddress1
WHERE        (VendorID = 1)

--5.Câu lệnh thêm một nhà cung cấp
Insert INTO vendors values
('Demo', 'Hà Nội', 'Hà Tây', 'HANOI', 'HN','100000','0989123456','lName','FName',1,552)
--6.Viết thêm câu lệnh Select trả về bốn trường dữ liệu sau từ bảng Invoices:
--Number: lấy dữ liệu từ cột InvoiceNumber
--Total :lấy dữ liệu từ cột InvoiceTotal
--Credits:Bằng tổng cột PaymentTotal và CreditTotal
--Balance:Bằng tổng InvoiceTotal-(PaymentTotal + CreditTotal)
SELECT        InvoiceNumber, InvoiceTotal, PaymentTotal + CreditTotal AS Credit, InvoiceTotal - (PaymentTotal + CreditTotal) AS balance
FROM            Invoices
--Sắp xết thứ tự giảm dần của trường Number
SELECT        InvoiceNumber
FROM            Invoices
ORDER BY InvoiceNumber DESC

--.Viết câu lệnh SELECT trả về tất cả các cột từ hai bảng Vendor và bảng Invoices sử dụng phép kết nối trong
SELECT        Vendors.*, Invoices.*
FROM            Vendors INNER JOIN
                         Invoices ON Vendors.VendorID = Invoices.VendorID