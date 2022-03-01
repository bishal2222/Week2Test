--here subquery is used to perfrom given task
--inner query provides the company name with dividend for 2 consecutive year and outer query uses table from inner query to generate company with dividend for atleast 3 consecutive year
--distinct keyword is used here in order to omit duplicate company name
--array_agg to aggregrate result column in array format as in expected ouput
--I used the difference of two consecutive year to resolve this task

	 select array_agg(distinct d3.company) valuestocks  
	from dividend as d3
	inner join
		(select distinct d1.company, d1.fiscal_year
		from dividend as d1 
		inner join dividend as d2
		on d1.company = d2.company and
		d1.fiscal_year - d2.fiscal_year = 10001) as d
	on d3.company = d.company and
	d3.fiscal_year - d.fiscal_year = 10001
