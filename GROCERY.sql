create table grocery_shops(
	id int primary key not null,
	name varchar(255)not null);
	
create table categories(
     id int primary key not null,
     name varchar(255) not null);

create table vendors(
    id int primary key not null,
    name varchar(255),
    location varchar(255),
	email varchar(255),
	contact int not null,
    grocery_id int not null,
    foreign key(grocery_id)references grocery_shops(id));
	
create table customers(
    id int primary key not null,
    name varchar(255) not null,
    email varchar(255) not null,
	contact int not null,
	password varchar(255)not null,
	location varchar(255) not null,
	grocery_id int not null,
	foreign key(grocery_id)references grocery_shops(id)
	
);
create table products(
	id int primary key not null,
	name varchar(255) not null,
	price int not null,
	description varchar(255) not null,
	image bytea ,
	category_id int not null,
	foreign key (category_id)references categories(id),
	customer_id int not null,
	foreign key (customer_id)references customers(id),
	vendor_id int not null,
	foreign key (vendor_id) references vendors(id)
);
create table admins(
	id int primary key not null,
	name varchar(255) not null,
	contact varchar(255),
	grocery_id int,
	foreign key (grocery_id) references grocery_shops(id)
);

create table orders(
	id int primary key not null,
	status varchar not null,
	quantity varchar not null,
	customer_id int not null,
	foreign key(customer_id)references customers(id),
	grocery_id int not null,
	foreign key(grocery_id)references grocery_shops(id),
	vendors_id int not null,
	foreign key(vendors_id)references vendors(id),
	admin_id int not null,
	foreign key(admin_id) references admins(id));

 create table delivery_men(
	id int primary key not null,
	name varchar(255) not null,
	contact varchar(255) not null,
	email varchar(255) not null,
	order_id int not null,
	foreign key(order_id)references orders(id)
);
	
create table cakes(
	name varchar(255) primary key not null,
	category  varchar not null,
	image bytea not null,
	price int not null,
	description varchar,
	recipes varchar not null,
	vendor_id int not null,
	foreign key(vendor_id)references vendors(id));

 create table users(
	id int primary key not null,
	name varchar(255) not null,
	user_type varchar(255));

	   
insert into users(id,name,user_type)
values(0010,'tracy','admin'),
      (020,'hellen','admin'),
	  (030,'kato','delivery_man'),
	  (040,'anita','vendor'),
	  (050,'Joy','vendor'),
	  (060,'loy','buyer'),
	  (070,'sarah','buyer'),
	  (080,'ruth','buyer'),
	  (090,'waswa','delivery_man');
	
    insert into grocery_shops(id,name)
    values(001,"Annex grocery");

    insert into categories(id, name)
    values(001,'fruits')
          (002,'snacks')
	      (003,'meat');
		  
	insert into vendors(id,name,location,email,contact,grocery_id)
     values(001,'anita','kisaasi','anita@gmail.com',0773968538,001),
       (002,'Joy','kyanja','joy@gmail.com',0778593621,001);
	
    insert into customers (id, name ,email,contact,password,location,grocery_id)
    values(001,'loy','loy@gmail.com','0756235689','','ntinda','001'),
      (002,'ruth','ruth@gmail.com',0798653247,'','kigoowa',001),
	  (003,'sarah','sarah@gmail.com',0756894512,'','nsangi',001);

	  alter table products
     add posted_by varchar;

   insert into products(id,name,price,description,image,category_id,customer_id,vendor_id,)
   values(001,'apples',5000,'fresh','image',001,002,002),
      (002,'daddies',3000,'fresh','image',002,001,001),
	  (003,'steak',10000,'fresh','image',003,002,001);

	update products
    set posted_by='vendors';

insert into admins(id,name,contact,grocery_id)
values(001,'tracy',0778562389,001),
       (002,'hellen',0745238547,001);
	   
insert into orders(id,status,quantity,customer_id,grocery_id,vendors_id,admin_id)
values(001,'confirmed','kgs',002,001,001,002),
      (002,'pending','gms',001,001,001,001),
	  (003,'confirmed','kgs',002,001,002,001),
	  (004,'confirmed','kgs',001,001,001,002);
	  
insert into delivery_men(id,name,contact,email,order_id)
values(001,'kato',0756234178,'kato@gmail.com',001),
       (002,'wasswa',078418936,'waswa@gmail.com',004),
	   (003,'lule',0765321478,'lule@gmail.com',003);
	   
insert into cakes(name,category,image,price,description,recipes,vendor_id)
values('blackforest','birthday','image',150000,'buttercream','wheat',001),
      ('redvelvet','wedding','image',200000,'buttercream','velvet',001),
	  ('chocolate','birthday','image',100000,'buttercream','cocoa',002);

-- (ii)make orders for a few products.
    SELECT name,price FROM products
    where name ='apples' or price=3000;
 
--  (iii)select products posted by the client.
   select *from products
   where posted_by = 'admins';

-- (iv)select all products posted by the vendors
   select *from products
   where posted_by = 'vendors';




	  
--   (v)select all users from the system
    select *from users;

-- (vi)select all users with user_type vendors
   select * from users
   where user_type='vendor';

-- (vii)select all users with user type of admin and buyer
    select * from users
    where user_type='admin'or user_type ='buyer';

 
	   