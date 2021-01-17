

create or replace view volcano_info as
select a.name volcano_name, a.type, a.activity, b.name size, c.name country, c.continent
from volcano a join size b on a.id_size = b.id join country c on a.id_country = c.id
order by 6,5,1;

select * from volcano_info;

create or replace view country_capitals as
select a.name country, b.name capital
from country a full join capital b on a.id_capital = b.id
order by 1,2;

select * from country_capitals;

create or replace view eruption_info as
select a.name volcano, b.date, b.casualties, b.economic_dmg_dollars, c.name pyroclast, d.id vei
from volcano a join eruption b on a.id = b.id_volcano join pyroclast c on b.id_pyroclast = c.id join vei d on b.id_vei = d.id
order by 2;

select * from eruption_info;

create or replace view sum_effects as
select sum(a.casualties) sum_casualties, sum(a.economic_dmg_dollars) sum_economic_dmg, b.name country
from eruption a join volcano c on a.id_volcano = c.id join country b on c.id_country = b.id
group by b.name
order by 3;

select * from sum_effects;

create or replace view top_deadly_volcanoes as
select volcano, sum_casualties, rank from
	(select volcano, sum_casualties, rank() over(order by sum_casualties desc nulls last) rank from
		(select sum(a.casualties) sum_casualties, b.name volcano
		from eruption a join volcano b on a.id_volcano = b.id
		group by b.name)f)g
where rank <= 5;

select * from top_deadly_volcanoes;


create or replace view countries_by_volcano_count as
select a.name country, a.continent, count(b.name) no_volcanoes, dense_rank() over(partition by a.continent order by count(b.name) desc nulls last) rank
from country a join volcano b on a.id = b.id_country
group by 1,2;

select * from countries_by_volcano_count;