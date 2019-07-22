select 
		CAST(r.Id as char) as 'Id', r.Description, r.Status, 
		CONCAT(u.Firstname, ' ', u.Lastname) as 'Name',
		p.Name, CAST(rl.Quantity as nvarchar(10)) as 'Qty', 
		CAST(p.Price as nvarchar(10)) as 'Price', (rl.Quantity * p.Price) as 'Subtotal'
	from Requests r
	join RequestLines rl
		on rl.RequestId = r.Id
	join Products p
		on p.Id = rl.ProductId
	join Users u
		on u.id = r.UserId
UNION
select '', '','', '', '', '', 'TOTAL:', sum(rl.Quantity * p.Price) as 'Total'
	from Requests r
	join RequestLines rl
		on rl.RequestId = r.Id
	join Products p
		on p.Id = rl.ProductId
	join Users u
		on u.id = r.UserId
	group by r.Id, r.Description
order by Id desc