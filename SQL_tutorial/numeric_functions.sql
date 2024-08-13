# Numeric functions

select *
from products
;

# round function

select round(123.456789,2);

select sale_price, round(sale_price,1)
from products;

# ceiling & floor

select ceiling(5.3);
select floor(5.7);

select sale_price, ceiling(sale_price), floor(sale_price)
from products;

# ABS
select abs(-4.6);

