#Create master table for customer
create table tradingbehaviour.customer as select distinct
Customer
from tradingbehaviour.df1;

create table tradingbehaviour.firstlevel as select 
customer, 
PnL_pips,
CloseDate,
Closemonth, 
CloseDay
from tradingbehaviour.df1;

create table tradingbehaviour.firstlevel_2 as select distinct
customer,
count(distinct CloseDate) as C_trade,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_trade,
count(CloseDate)/28 as F_trade,
sum(PnL_pips)/28 as M_trade
from tradingbehaviour.firstlevel
group by customer
order by customer;


/********************** DIMENSION 1 - TRADING STYLE/HOLDING PERIOD **********************/
/********************************Style_Superscalping****************************************/
create table tradingbehaviour.style_superscalping as select 
customer, 
PnL_pips,
CloseDate,
Closemonth, 
CloseDay, 
I_Superscalping
from tradingbehaviour.df1
where I_Superscalping = 1;

#drop table tradingbehaviour.style_superscalping_2; 
create table tradingbehaviour.style_superscalping_2 as select distinct
customer,
case when count(I_Superscalping)>0 then 1 else 0 end as I_Superscalping,
count(distinct CloseDate) as C_Superscalping,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Superscalping,
count(I_Superscalping)/28 as F_Superscalping,
sum(PnL_pips)/28 as M_Superscalping
from tradingbehaviour.style_superscalping 
group by customer
order by customer;

/********************************Style_Scalping****************************************/
create table tradingbehaviour.style_scalping as select 
customer, 
PnL_pips,
CloseDate,
Closemonth, 
CloseDay, 
I_Scalping
from tradingbehaviour.df1
where I_Scalping = 1;

#drop table tradingbehaviour.style_scalping_2; 
create table tradingbehaviour.style_scalping_2 as select distinct
customer,
case when count(I_Scalping)>0 then 1 else 0 end as I_Scalping,
count(distinct CloseDate) as C_Scalping,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Scalping,
count(I_Scalping)/28 as F_Scalping,
sum(PnL_pips)/28 as M_Scalping
from tradingbehaviour.style_scalping 
group by customer
order by customer;

/********************************Style_Daytrade****************************************/
create table tradingbehaviour.style_daytrade as select 
customer, 
PnL_pips,
CloseDate,
Closemonth, 
CloseDay, 
I_Daytrade
from tradingbehaviour.df1
where I_Daytrade = 1;

#drop table tradingbehaviour.style_daytrade_2; 
create table tradingbehaviour.style_daytrade_2 as select distinct
customer,
case when count(I_Daytrade)>0 then 1 else 0 end as I_Daytrade,
count(distinct CloseDate) as C_Daytrade,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Daytrade,
count(I_Daytrade)/28 as F_Daytrade,
sum(PnL_pips)/28 as M_Daytrade
from tradingbehaviour.style_daytrade 
group by customer
order by customer;

/**********************************Style_Swing******************************************/
create table tradingbehaviour.style_swing as select 
customer, 
PnL_pips,
CloseDate,
Closemonth, 
CloseDay, 
I_Swing
from tradingbehaviour.df1
where I_Swing = 1;

#drop table tradingbehaviour.style_swing_2; 
create table tradingbehaviour.style_swing_2 as select distinct
customer,
case when count(I_Swing)>0 then 1 else 0 end as I_Swing,
count(distinct CloseDate) as C_Swing,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Swing,
count(I_Swing)/28 as F_Swing,
sum(PnL_pips)/28 as M_Swing
from tradingbehaviour.style_swing 
group by customer
order by customer;

/********************************Style_Position****************************************/
create table tradingbehaviour.style_position as select 
customer, 
PnL_pips,
CloseDate,
Closemonth, 
CloseDay, 
I_Position
from tradingbehaviour.df1
where I_Position = 1;

#drop table tradingbehaviour.style_position_2; 
create table tradingbehaviour.style_position_2 as select distinct
customer,
case when count(I_Position)>0 then 1 else 0 end as I_Position,
count(distinct CloseDate) as C_Position,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Position,
count(I_Position)/28 as F_Position,
sum(PnL_pips)/28 as M_Position
from tradingbehaviour.style_position 
group by customer
order by customer;


/********************** DIMENSION 2 - TRADING TIME SESSION **********************/
/********************************Open_Close_Europe****************************************/
create table tradingbehaviour.tradetime_Europe_open as select 
customer, 
PnL_pips,
OpenDate,
OpenMonth, 
OpenDay, 
I_Europe_Open
from tradingbehaviour.df1
where I_Europe_Open = 1;

#drop table tradingbehaviour.tradetime_Europe_open_2; 
create table tradingbehaviour.tradetime_Europe_open_2 as select distinct
customer,
case when count(I_Europe_Open)>0 then 1 else 0 end as I_Europe_Open,
count(distinct OpenDate) as C_Europe_Open,
case when max(openmonth)=2 and min(openday)=1 then 1
	 when max(openmonth)=2 and min(openday)=2 then 0
	 when max(openmonth)=1 and max(openday)>27 then 33-max(openday)
	 when max(openmonth)=1 and max(openday)>20 then 32-max(openday)
     when max(openmonth)=1 and max(openday)>13 then 31-max(openday)
     when max(openmonth)=1 and max(openday)>6 then 30-max(openday)
     else 29-max(openday) end as R_Europe_Open,
count(I_Europe_Open)/28 as F_Europe_Open,
sum(PnL_pips)/28 as M_Europe_Open
from tradingbehaviour.tradetime_Europe_open
group by customer
order by customer;

create table tradingbehaviour.tradetime_Europe_close as select 
customer, 
PnL_pips,
CloseDate,
CloseMonth, 
CloseDay, 
I_Europe_Close
from tradingbehaviour.df1
where I_Europe_Close = 1;

#drop table tradingbehaviour.tradetime_Europe_close_2; 
create table tradingbehaviour.tradetime_Europe_close_2 as select distinct
customer,
case when count(I_Europe_Close)>0 then 1 else 0 end as I_Europe_Close,
count(distinct CloseDate) as C_Europe_Close,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Europe_Close,
count(I_Europe_Close)/28 as F_Europe_Close,
sum(PnL_pips)/28 as M_Europe_Close
from tradingbehaviour.tradetime_Europe_close
group by customer
order by customer;

/********************************Open_Close_US****************************************/
create table tradingbehaviour.tradetime_US_open as select 
customer, 
PnL_pips,
OpenDate,
OpenMonth, 
OpenDay, 
I_US_Open
from tradingbehaviour.df1
where I_US_Open = 1;

#drop table tradingbehaviour.tradetime_US_open_2; 
create table tradingbehaviour.tradetime_US_open_2 as select distinct
customer,
case when count(I_US_Open)>0 then 1 else 0 end as I_US_Open,
count(distinct OpenDate) as C_US_Open,
case when max(openmonth)=2 and min(openday)=1 then 1
	 when max(openmonth)=2 and min(openday)=2 then 0
	 when max(openmonth)=1 and max(openday)>27 then 33-max(openday)
	 when max(openmonth)=1 and max(openday)>20 then 32-max(openday)
     when max(openmonth)=1 and max(openday)>13 then 31-max(openday)
     when max(openmonth)=1 and max(openday)>6 then 30-max(openday)
     else 29-max(openday) end as R_US_Open,
count(I_US_Open)/28 as F_US_Open,
sum(PnL_pips)/28 as M_US_Open
from tradingbehaviour.tradetime_US_open
group by customer
order by customer;

create table tradingbehaviour.tradetime_US_close as select 
customer, 
PnL_pips,
CloseDate,
CloseMonth, 
CloseDay, 
I_US_Close
from tradingbehaviour.df1
where I_US_Close = 1;

#drop table tradingbehaviour.tradetime_US_close_2; 
create table tradingbehaviour.tradetime_US_close_2 as select distinct
customer,
case when count(I_US_Close)>0 then 1 else 0 end as I_US_Close,
count(distinct CloseDate) as C_US_Close,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_US_Close,
count(I_US_Close)/28 as F_US_Close,
sum(PnL_pips)/28 as M_US_Close
from tradingbehaviour.tradetime_US_close
group by customer
order by customer;

/********************************Open_Close_Asia****************************************/
create table tradingbehaviour.tradetime_Asia_open as select 
customer, 
PnL_pips,
OpenDate,
OpenMonth, 
OpenDay, 
I_Asia_Open
from tradingbehaviour.df1
where I_Asia_Open = 1;

#drop table tradingbehaviour.tradetime_Asia_open_2; 
create table tradingbehaviour.tradetime_Asia_open_2 as select distinct
customer,
case when count(I_Asia_Open)>0 then 1 else 0 end as I_Asia_Open,
count(distinct OpenDate) as C_Asia_Open,
case when max(openmonth)=2 and min(openday)=1 then 1
	 when max(openmonth)=2 and min(openday)=2 then 0
	 when max(openmonth)=1 and max(openday)>27 then 33-max(openday)
	 when max(openmonth)=1 and max(openday)>20 then 32-max(openday)
     when max(openmonth)=1 and max(openday)>13 then 31-max(openday)
     when max(openmonth)=1 and max(openday)>6 then 30-max(openday)
     else 29-max(openday) end as R_Asia_Open,
count(I_Asia_Open)/28 as F_Asia_Open,
sum(PnL_pips)/28 as M_Asia_Open
from tradingbehaviour.tradetime_Asia_open
group by customer
order by customer;

create table tradingbehaviour.tradetime_Asia_close as select 
customer, 
PnL_pips,
CloseDate,
CloseMonth, 
CloseDay, 
I_Asia_Close
from tradingbehaviour.df1
where I_Asia_Close = 1;

#drop table tradingbehaviour.tradetime_Asia_close_2; 
create table tradingbehaviour.tradetime_Asia_close_2 as select distinct
customer,
case when count(I_Asia_Close)>0 then 1 else 0 end as I_Asia_Close,
count(distinct CloseDate) as C_Asia_Close,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Asia_Close,
count(I_Asia_Close)/28 as F_Asia_Close,
sum(PnL_pips)/28 as M_Asia_Close
from tradingbehaviour.tradetime_Asia_close
group by customer
order by customer;

/************************* DIMENSION 3 - TRADING PRODUCTS ***********************/
/********************************product_majorcurrency****************************************/
create table tradingbehaviour.product_majorcurrency as select 
customer, 
PnL_pips,
CloseDate,
CloseMonth, 
CloseDay, 
I_Majorcurrency
from tradingbehaviour.df1
where I_Majorcurrency = 1;

#drop table tradingbehaviour.product_majorcurrency_2; 
create table tradingbehaviour.product_majorcurrency_2 as select distinct
customer,
case when count(I_Majorcurrency)>0 then 1 else 0 end as I_Majorcurrency,
count(distinct CloseDate) as C_Majorcurrency,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Majorcurrency,
count(I_Majorcurrency)/28 as F_Majorcurrency,
sum(PnL_pips)/28 as M_Majorcurrency
from tradingbehaviour.product_majorcurrency
group by customer
order by customer;

/********************************product_minorcurrency****************************************/
create table tradingbehaviour.product_minorcurrency as select 
customer, 
PnL_pips,
CloseDate,
CloseMonth, 
CloseDay, 
I_Minorcurrency
from tradingbehaviour.df1
where I_Minorcurrency = 1;

#drop table tradingbehaviour.product_minorcurrency_2; 
create table tradingbehaviour.product_minorcurrency_2 as select distinct
customer,
case when count(I_Minorcurrency)>0 then 1 else 0 end as I_Minorcurrency,
count(distinct CloseDate) as C_Minorcurrency,
case when max(closemonth)=2 and min(closeday)=1 then 1
	 when max(closemonth)=2 and min(closeday)=2 then 0
	 when max(closemonth)=1 and max(closeday)>27 then 33-max(closeday)
	 when max(closemonth)=1 and max(closeday)>20 then 32-max(closeday)
     when max(closemonth)=1 and max(closeday)>13 then 31-max(closeday)
     when max(closemonth)=1 and max(closeday)>6 then 30-max(closeday)
     else 29-max(closeday) end as R_Minorcurrency,
count(I_Minorcurrency)/28 as F_Minorcurrency,
sum(PnL_pips)/28 as M_Minorcurrency
from tradingbehaviour.product_minorcurrency
group by customer
order by customer;


/********************************************************************************/
/********************************************************************************/
/********************************************************************************/
/************************ CCOMPILATION OF ALL TABLES ****************************/
/********************************************************************************/
/********************************************************************************/
/********************************************************************************/

create table tradingbehaviour.compiled_df as select
a.customer,
/******Dimension 1 - TRADING STYLE/HOLDING PERIOD******/
/*****Table - style_superscalping_2******/
b.I_Superscalping,
b.C_Superscalping,
b.R_Superscalping,
b.F_Superscalping,
b.M_Superscalping,
/******Table - style_scalping_2******/
c.I_Scalping,
c.C_Scalping,
c.R_Scalping,
c.F_Scalping,
c.M_Scalping,
/******Table - style_daytrade_2******/
d.I_Daytrade,
d.C_Daytrade,
d.R_Daytrade,
d.F_Daytrade,
d.M_Daytrade,
/******Table - style_swing_2******/
e.I_Swing,
e.C_Swing,
e.R_Swing,
e.F_Swing,
e.M_Swing,
/******Table - style_position_2******/
f.I_Position,
f.C_Position,
f.R_Position,
f.F_Position,
f.M_Position,
/******Dimension 2 - TRADING TIME SESSION******/
/*****Table - tradetime_us_open_2******/
g.I_US_Open,
g.C_US_Open,
g.R_US_Open,
g.F_US_Open,
g.M_US_Open,
/*****Table - tradetime_us_close_2******/
h.I_US_Close,
h.C_US_Close,
h.R_US_Close,
h.F_US_Close,
h.M_US_Close,
/*****Table - tradetime_asia_open_2******/
i.I_Asia_Open,
i.C_Asia_Open,
i.R_Asia_Open,
i.F_Asia_Open,
i.M_Asia_Open,
/*****Table - tradetime_asia_close_2******/
j.I_Asia_Close,
j.C_Asia_Close,
j.R_Asia_Close,
j.F_Asia_Close,
j.M_Asia_Close,
/*****Table - tradetime_europe_close_2******/
k.I_Europe_Open,
k.C_Europe_Open,
k.R_Europe_Open,
k.F_Europe_Open,
k.M_Europe_Open,
/*****Table - tradetime_europe_close_2******/
l.I_Europe_Close,
l.C_Europe_Close,
l.R_Europe_Close,
l.F_Europe_Close,
l.M_Europe_Close,
/******Dimension 3 - TRADING PRODUCTS******/
/*****Table - product_majorcurrency_2******/
m.I_majorcurrency,
m.C_majorcurrency,
m.R_majorcurrency,
m.F_majorcurrency,
m.M_majorcurrency,
/*****Table - product_minorcurrency_2******/
n.I_minorcurrency,
n.C_minorcurrency,
n.R_minorcurrency,
n.F_minorcurrency,
n.M_minorcurrency,

/*****Table - firstlevel_2******/
o.C_trade,
o.R_trade,
o.F_trade,
o.M_trade

from tradingbehaviour.customer		 					as a
left join tradingbehaviour.style_superscalping_2 		as b on a.customer=b.customer
left join tradingbehaviour.style_scalping_2		 		as c on a.customer=c.customer
left join tradingbehaviour.style_daytrade_2	 			as d on a.customer=d.customer
left join tradingbehaviour.style_swing_2		 		as e on a.customer=e.customer
left join tradingbehaviour.style_position_2			 	as f on a.customer=f.customer
left join tradingbehaviour.tradetime_us_open_2		 	as g on a.customer=g.customer
left join tradingbehaviour.tradetime_us_close_2		 	as h on a.customer=h.customer
left join tradingbehaviour.tradetime_asia_open_2	 	as i on a.customer=i.customer
left join tradingbehaviour.tradetime_asia_close_2		as j on a.customer=j.customer
left join tradingbehaviour.tradetime_europe_open_2	 	as k on a.customer=k.customer
left join tradingbehaviour.tradetime_europe_close_2	 	as l on a.customer=l.customer
left join tradingbehaviour.product_majorcurrency_2	 	as m on a.customer=m.customer
left join tradingbehaviour.product_minorcurrency_2	 	as n on a.customer=n.customer
left join tradingbehaviour.firstlevel_2					as o on a.customer=o.customer
order by a.customer;


create table tradingbehaviour.compiled_df_2 as select
customer,
/******Dimension 1 - TRADING STYLE/HOLDING PERIOD******/
/*****Table - style_superscalping_2******/
ifnull(I_Superscalping,0)						as I_Superscalping,
ifnull(C_Superscalping,0)						as C_Superscalping,
ifnull(R_Superscalping,27)						as R_Superscalping,
ifnull(format(F_Superscalping,3),0)				as F_Superscalping,
ifnull(format(M_Superscalping,3),0)				as M_Superscalping,
/******Table - style_scalping_2******/
ifnull(I_Scalping,0)							as I_Scalping,
ifnull(C_Scalping,0)							as C_Scalping,
ifnull(R_Scalping,27)							as R_Scalping,
ifnull(format(F_Scalping,3),0)					as F_Scalping,
ifnull(format(M_Scalping,3),0)					as M_Scalping,
/******Table - style_daytrade_2******/
ifnull(I_Daytrade,0)							as I_Daytrade,
ifnull(C_Daytrade,0)							as C_Daytrade,
ifnull(R_Daytrade,27)							as R_Daytrade,
ifnull(format(F_Daytrade,3),0)					as F_Daytrade,
ifnull(format(M_Daytrade,3),0)					as M_Daytrade,
/******Table - style_swing_2******/
ifnull(I_Swing,0)								as I_Swing,
ifnull(C_Swing,0)								as C_Swing,
ifnull(R_Swing,27)								as R_Swing,
ifnull(format(F_Swing,3),0)						as F_Swing,
ifnull(format(M_Swing,3),0)						as M_Swing,
/******Table - style_position_2******/
ifnull(I_Position,0)							as I_Position,
ifnull(C_Position,0)							as C_Position,
ifnull(R_Position,27)							as R_Position,
ifnull(format(F_Position,3),0)					as F_Position,
ifnull(format(M_Position,3),0)					as M_Position,
/******Dimension 2 - TRADING TIME SESSION******/
/*****Table - tradetime_us_open_2******/
ifnull(I_US_Open,0)								as I_US_Open,
ifnull(C_US_Open,0)								as C_US_Open,
ifnull(R_US_Open,27)								as R_US_Open,
ifnull(format(F_US_Open,3),0)					as F_US_Open,
ifnull(format(M_US_Open,3),0)					as M_US_Open,
/*****Table - tradetime_us_close_2******/
ifnull(I_US_Close,0)							as I_US_Close,
ifnull(C_US_Close,0)							as C_US_Close,
ifnull(R_US_Close,27)							as R_US_Close,
ifnull(format(F_US_Close,3),0)					as F_US_Close,
ifnull(format(M_US_Close,3),0)					as M_US_Close,
/*****Table - tradetime_asia_open_2******/
ifnull(I_Asia_Open,0)							as I_Asia_Open,
ifnull(C_Asia_Open,0)							as C_Asia_Open,
ifnull(R_Asia_Open,27)							as R_Asia_Open,
ifnull(format(F_Asia_Open,3),0)					as F_Asia_Open,
ifnull(format(M_Asia_Open,3),0)					as M_Asia_Open,
/*****Table - tradetime_asia_close_2******/
ifnull(I_Asia_Close,0)							as I_Asia_Close,
ifnull(C_Asia_Close,0)							as C_Asia_Close,
ifnull(R_Asia_Close,27)							as R_Asia_Close,
ifnull(format(F_Asia_Close,3),0)				as F_Asia_Close,
ifnull(format(M_Asia_Close,3),0)				as M_Asia_Close,
/*****Table - tradetime_europe_close_2******/
ifnull(I_Europe_Open,0)							as I_Europe_Open,
ifnull(C_Europe_Open,0)							as C_Europe_Open,
ifnull(R_Europe_Open,27)							as R_Europe_Open,
ifnull(format(F_Europe_Open,3),0)				as F_Europe_Open,
ifnull(format(M_Europe_Open,3),0)				as M_Europe_Open,
/*****Table - tradetime_europe_close_2******/
ifnull(I_Europe_Close,0)						as I_Europe_Close,
ifnull(C_Europe_Close,0)						as C_Europe_Close,
ifnull(R_Europe_Close,27)						as R_Europe_Close,
ifnull(format(F_Europe_Close,3),0)				as F_Europe_Close,
ifnull(format(M_Europe_Close,3),0)				as M_Europe_Close,
/******Dimension 3 - TRADING PRODUCTS******/
/*****Table - product_majorcurrency_2******/
ifnull(I_majorcurrency,0)						as I_majorcurrency,
ifnull(C_majorcurrency,0)						as C_majorcurrency,
ifnull(R_majorcurrency,27)						as R_majorcurrency,
ifnull(format(F_majorcurrency,3),0)				as F_majorcurrency,
ifnull(format(M_majorcurrency,3),0)				as M_majorcurrency,
/*****Table - product_minorcurrency_2******/
ifnull(I_minorcurrency,0)						as I_minorcurrency,
ifnull(C_minorcurrency,0)						as C_minorcurrency,
ifnull(R_minorcurrency,27)						as R_minorcurrency,
ifnull(format(F_minorcurrency,3),0)				as F_minorcurrency,
ifnull(format(M_minorcurrency,3),0)				as M_minorcurrency,
/*****Table - firstlevel_2******/
ifnull(C_trade,0)								as C_trade,
ifnull(R_trade,27)								as R_trade,
ifnull(format(F_trade,3),0)						as F_trade,
ifnull(format(M_trade,3),0)						as M_trade

from tradingbehaviour.compiled_df
order by customer;



