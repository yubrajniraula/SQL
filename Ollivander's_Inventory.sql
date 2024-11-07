-- Solution to Ollivander's Inventory problem in HackerRank

-- tables: Wands, Wands_property
-- task: determine the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
        -- As obvious, choose the lower coins_needed for any wand that has same age and power.  
        -- print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power.
        -- If more than one wand has same power, sort the result in order of descending age.

select w.id, wp.age, w.coins_needed, w.power
from wands w, wands_property wp
where w.code = wp.code and wp.is_evil = 0 and w.coins_needed = (
    select min(w1.coins_needed)
    from wands_property wp1, wands w1
    where w1.code = wp1.code and
        wp.age = wp1.age and
        w.power = w1.power
    )
order by w.power desc, wp.age desc;
