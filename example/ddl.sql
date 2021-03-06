drop table if exists order_detail;
drop table if exists customer_order;
drop table if exists sku;
drop table if exists product;
drop table if exists vendor;
drop table if exists customer;


create table customer (
  id bigserial primary key
  , name text not null
  , zip_code text not null
  , address text not null
  , phone_number text not null
);

create table vendor (
  id bigserial primary key
  , name text not null
  , zip_code text not null
  , address text not null
  , phone_number text not null
);

create table product (
  id bigserial primary key
  , vendor_id bigint not null
  , name text not null
  , country text not null
  , category text not null
  , FOREIGN KEY(vendor_id) REFERENCES vendor (id)
);

create table sku (
  id bigserial primary key
  , product_id bigint not null
  , color text not null
  , size text not null
  , weight numeric not null
  , sales_unit_price numeric not null
  , purchase_unit_price numeric not null
  , FOREIGN KEY(product_id) REFERENCES product (id)
);

create table customer_order (
  id bigserial primary key
  , customer_id bigint not null
  , delivery_method text not null
  , shipping_address text not null
  , payment_method text not null
  , total_price numeric not null
  , total_tax_amount numeric not null
  , ordered_at timestamp with time zone not null
  , FOREIGN KEY(customer_id) REFERENCES customer (id)
);

create table order_detail (
  id bigserial not null
  , customer_order_id bigint not null
  , sku_id bigint not null
  , amount bigint not null
  , price_before_tax numeric not null
  , price_after_tax numeric not null
  , ordered_at timestamp with time zone not null
  , PRIMARY KEY(id, customer_order_id)
  , FOREIGN KEY(customer_order_id) REFERENCES customer_order (id)
  , FOREIGN KEY(sku_id) REFERENCES sku (id)
);
