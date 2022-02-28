select array (
	select d3.company 
	from dividend as d3
	inner join
		(select d1.company, d1.fiscal_year
		from dividend as d1 
		inner join dividend as d2
		on d1.company = d2.company and
		d1.fiscal_year - d2.fiscal_year = 10001) as d
	on d3.company = d.company and
	d3.fiscal_year - d.fiscal_year = 10001
)as valuestocks