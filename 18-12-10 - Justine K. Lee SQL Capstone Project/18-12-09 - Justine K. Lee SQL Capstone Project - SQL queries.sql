1	select * from survey limit 10;
2	select question, count(distinct user_id) from survey group by question;
3	none
4	select * from quiz limit 5;
	select * from home_try_on limit 5;
	select * from purchase limit 5;
5	select distinct q.user_id, h.user_id is not null as 'is_home_try_on', h.number_of_pairs, p.user_id is not null as 'is_purchase' from quiz q left join home_try_on h on q.user_id = h.user_id left join purchase p on p.user_id = q.user_id limit 10;
6	with funnels as (select distinct q.user_id, h.user_id is not null as 'is_home_try_on', h.number_of_pairs, p.user_id is not null as 'is_purchase' from quiz q left join home_try_on as 'h' on q.user_id = h.user_id left join purchase p on p.user_id = q.user_id) select count(*) as 'num_browse', sum(is_home_try_on) as 'num_try_on', sum(is_purchase) as 'num_purchase', 1.0 * sum(is_home_try_on)/count(user_id) as 'browse_to_try_on', 1.0 * sum(is_purchase)/sum(is_home_try_on) as 'try_on_to_purchase' from funnels;
	with funnels as (select distinct q.user_id, h.user_id is not null as 'is_home_try_on', h.number_of_pairs, p.user_id is not null as 'is_purchase' from quiz q left join home_try_on as 'h' on q.user_id = h.user_id left join purchase p on p.user_id = q.user_id) select number_of_pairs, count(*) as 'num_browse', sum(is_home_try_on) as 'num_try_on', sum(is_purchase) as 'num_purchase', 1.0 * sum(is_home_try_on)/count(user_id) as 'browse_to_try_on', 1.0 * sum(is_purchase)/sum(is_home_try_on) as 'try_on_to_purchase' from funnels group by number_of_pairs order by number_of_pairs;
	select style, count(*) from quiz group by 1 order by count(*) desc;
	select fit, count(*) from quiz group by 1 order by count(*) desc;
	select shape, count(*) from quiz group by 1 order by count(*) desc;
	select color, count(*) from quiz group by 1 order by count(*) desc;		

