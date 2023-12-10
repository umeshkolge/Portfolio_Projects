select * from hr1;
											-- Average attrition rate for all department
select department , count(attrition) as total_attrition 
from hr1
where attrition = 'yes'
group by department
order by total_attrition desc;

                                          -- Average Hourly rate of Male Research Scientist

select * from hr1;
select avg(hourlyrate) as Average_rate from hr1
where Gender='male' and department='Research & Development';

											-- Attrition rate Vs Monthly income stats
select * from hr1;
select * from hr2emp;


SELECT h1.department,
round((count(h1.attrition)/(select count(h1.employeenumber) from hr1 h1)*100),2) as attrition_rate, 
round(avg(h2.monthlyincome),2) as monthlystats
from hr1 h1 join hr2emp h2
on h1.EmployeeNumber=h2.`employee id`
where h1.Attrition ='yes'
group by h1.Department
order by attrition_rate desc;

									     -- Average working years for each Department
select * from hr1;
select * from hr2emp; 

select h1.department, round(avg(h2.yearsatcompany),2) as avg_years
from hr1 h1 join hr2emp h2 
on h1.EmployeeNumber = h2.`Employee ID`
group by h1.Department;

                                                 --  Job Role Vs Work life balance
select h1.jobrole, h2.worklifebalance, count(h2.`employee id`) as total_emp
from hr1 h1 join hr2emp h2 
on h1.EmployeeNumber = h2.`Employee ID`
group by h1.jobrole, h2.WorkLifeBalance 
order by h1.JobRole, h2.WorkLifeBalance;

                                      -- Attrition rate Vs Year since last promotion relation
select count(h1.attrition) as total_attrition , h2.yearssincelastpromotion
from hr1 h1 join hr2emp h2
on h1.EmployeeNumber=h2.`Employee ID`
where Attrition='yes'
group by YearsSinceLastPromotion
order by YearsSinceLastPromotion;

  

                                   -- ---------- attrition count vs distance from home -----------
select count(attrition), distancefromhome from hr1
where Attrition='yes'
group by DistanceFromHome;

                                        -- ---------- attrition count vs educationfield -----------
select educationfield, count(attrition) as total_attrition
from hr1
where attrition ='yes'
group by educationfield;