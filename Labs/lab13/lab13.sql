.read data.sql

-- QUESTIONS --



-------------------------------------------------------------------------
------------------------ Give Interest- ---------------------------------
-------------------------------------------------------------------------

update accounts set amount = amount * 1.02;

create table give_interest_result as select * from accounts; -- just for tests

-------------------------------------------------------------------------
------------------------ Split Accounts ---------------------------------
-------------------------------------------------------------------------

create table temp_accounts(name, amount);
insert into temp_accounts
	select name || "'s Checking account", amount / 2 
	from accounts;
insert into temp_accounts
	select name || "'s Savings account", amount / 2
	from accounts;
insert into accounts
	select * from temp_accounts;
delete from accounts where not (instr(name, "account") > 0);

create table split_account_results as select * from accounts; -- just for tests

-------------------------------------------------------------------------
-------------------------------- Whoops ---------------------------------
-------------------------------------------------------------------------

drop table accounts;


CREATE TABLE average_prices AS
  SELECT category, avg(MSRP) AS average_price FROM products GROUP BY category;

CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) AS price_min FROM inventory GROUP BY item;

CREATE TABLE shopping_list AS
  SELECT name, store FROM lowest_prices, products GROUP BY item HAVING min(MSRP/rating);

CREATE TABLE total_bandwidth AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
