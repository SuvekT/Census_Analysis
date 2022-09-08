
-- number of rows into our dataset
select count(*)  from project.dataset1
union
select count(*)  from project.dataset2;

-- dataset for zarkhand and bihar
select * from  project.dataset1 where state in ('Jharkhand','Bihar') order by Literacy;

-- know the total population of india
select sum(population) as population  from project.dataset2;
select * from dataset2;

-- average growth of India
select avg(growth) as AverageGrowth from dataset1;

-- average growth statewise
select state,avg(growth) from dataset1 group by state order by state;

-- average sex ratio per state 
SELECT 
    state, ROUND(AVG(sex_ratio))
FROM
    dataset1
GROUP BY state
ORDER BY AVG(Sex_Ratio) DESC;

-- Average growth percentage  rankwise
select state,avg(growth) from dataset1 group by state order by avg(growth) desc;
 
 -- average sex ratio
 select state,round(avg(Sex_Ratio),0) from dataset1 group by state order by avg(Sex_ratio) desc;

-- average literacy rate greater than 90
select state,avg(Literacy) from dataset1 group by state having avg(Literacy)>90;

-- top 3 state with highest literacy
select state,avg(Literacy) from dataset1 group by 
state order by avg(Literacy) desc limit 3;

-- bottom 3 state showing lowest sex ratio
select state, avg(sex_ratio) from dataset1 group by
state order by avg(sex_ratio) limit 3;

-- top and bottom 3 states in literacy state
  -- require to make temperary table
create table topstates(
state nvarchar(255),
topstate float
);
insert into topstates
select state,avg(Literacy) from dataset1 group by 
state order by avg(Literacy) desc limit 3;

-- checking table is created or not
select * from topstates;

-- now making temprory bottom states table
create table bottomstates(
state nvarchar(255),
bottomstate float
);
-- insert values in that table
insert into bottomstates
select state,avg(literacy) from dataset1 group by state order by avg(literacy) limit 3;

-- checking table os created or not
select* from bottomstates;

-- now both topstates and bottomstates in one table
select * from topstates
union
select * from bottomstates;

-- states starting from 'a'
select distinct state from dataset1 where lower(state) like 'a%';




