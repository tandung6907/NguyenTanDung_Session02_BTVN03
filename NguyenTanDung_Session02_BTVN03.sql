use homework;

-- PHÂN TÍCH:
-- thực thể: order, customers
-- thuộc tính: 
-- + order: mã đơn (PK), ngày đặt, tổng tiền, mã khách hàng (FK)
-- + customers: mã khách hàng (PK), tên khách, tuổi, số điện thoại, email, địa chỉ
-- tất cả không để trống

create table customers1(
	customer_id int primary key,
    customer_name varchar(100) not null,
    customer_age int not null
    check (customer_age > 0),
    customer_phone char(11) not null,
    email varchar(100) not null
); 	

create table address(
	address_id int primary key auto_increment,
    customer_id int not null,
    foreign key (customer_id) references customers1(customer_id),
    home_number varchar(10) not null,
    ward varchar(50) not null,
    district varchar(50) not null,
    city varchar(50) not null
);

create table orders(
	order_id int primary key,
    customer_id int,
    foreign key (customer_id) references customers1(customer_id),
    order_date timestamp default (current_timestamp),
    total_price decimal(19,4) not null
);